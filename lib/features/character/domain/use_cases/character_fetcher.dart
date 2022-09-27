import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rick/core/enums.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';

typedef FetcherChange = Function(LoadState state, QueryItems<CharacterEntity>? data);

class CharacterFetcherResult {
  final LoadState state;
  final QueryItems<CharacterEntity>? data;

  CharacterFetcherResult({
    required this.data,
    required this.state,
  });
}

class CharacterFetcher with Disposable {
  CharacterFetcher({
    required CharacterRepository characterRepository,
  }) : _characterRepository = characterRepository;

  CharacterFilter _filter = CharacterFilter.empty();
  int _latestFetchID = 0;
  QueryItems<CharacterEntity>? _items;
  final CharacterRepository _characterRepository;

  final fetchStateStreamController = StreamController<CharacterFetcherResult>.broadcast();

  // If during fetch, another fetch is called, cancels the first one by returning without adding result to stream
  Future<void> fetch({Duration? debounceDuration}) async {
    if (_items != null && _items!.hasMorePages == false) return;

    final fetchID = _getNewFetchID();
    _emitStreamEvent(state: LoadState.loading, data: _items);

    await _waitDebounce(debounceDuration);
    if (_isFetchOutdated(fetchID)) return;

    final pageNumber = _getNextPageNumber();
    final result = await _characterRepository.getCharacters(page: pageNumber, filter: _filter);
    if (_isFetchOutdated(fetchID)) return;

    result.bimap(
      (failure) => _emitStreamEvent(state: LoadState.error),
      (fetchedItems) {
        _items = _items == null ? fetchedItems : _items!.merge(fetchedItems);
        _emitStreamEvent(state: LoadState.data, data: _items);
      },
    );
  }

  void setFilter(CharacterFilter filter) {
    if (_filter != filter) return;

    _filter = filter;
    _items = null;
  }

  // Each fetch request gets unique fetchID, used for dismissing outdated fetches
  int _getNewFetchID() => ++_latestFetchID;

  bool _isFetchOutdated(int fetchID) => fetchID != _latestFetchID;

  void _emitStreamEvent({required LoadState state, QueryItems<CharacterEntity>? data}) {
    fetchStateStreamController.add(CharacterFetcherResult(data: data, state: state));
  }

  Future<void> _waitDebounce(Duration? duration) async {
    if (duration != null) await Future.delayed(duration);
  }

  int _getNextPageNumber() => (_items?.currentPage ?? 0) + 1;

  @override
  FutureOr onDispose() {
    fetchStateStreamController.close();
  }
}
