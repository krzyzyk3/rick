import 'package:rick/core/enums.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';

typedef FetcherChange = Function(LoadState state, QueryItems<CharacterEntity>? data);

class CharacterFetcher {
  CharacterFetcher({
    required FetcherChange fetcherStateCallback,
    required CharacterRepository characterRepository,
  })  : _stateChangedCallback = fetcherStateCallback,
        _characterRepository = characterRepository;

  CharacterFilter _filter = CharacterFilter.empty();
  int _latestFetchID = 0;
  QueryItems<CharacterEntity>? _items;

  final FetcherChange _stateChangedCallback;
  final CharacterRepository _characterRepository;

  // If during fetch, another fetch is called, cancels the first one by returning without callback
  Future<void> fetch({Duration? debounceDuration}) async {
    if (_items != null && _items!.hasMorePages == false) return;

    final fetchID = _getNewFetchID();
    _stateChangedCallback(LoadState.loading, _items);

    await _waitDebounce(debounceDuration);
    if (_isFetchOutdated(fetchID)) return;

    final pageNumber = _getNextPageNumber();
    final result = await _characterRepository.getCharacters(page: pageNumber, filter: _filter);
    if (_isFetchOutdated(fetchID)) return;

    result.bimap(
      (failure) => _stateChangedCallback(LoadState.error, null),
      (fetchedItems) {
        _items = _items == null ? fetchedItems : _items!.merge(fetchedItems);
        _stateChangedCallback(LoadState.data, _items);
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

  Future<void> _waitDebounce(Duration? duration) async {
    if (duration != null) await Future.delayed(duration);
  }

  int _getNextPageNumber() => (_items?.currentPage ?? 0) + 1;
}
