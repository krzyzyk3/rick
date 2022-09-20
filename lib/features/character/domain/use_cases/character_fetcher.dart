import 'package:rick/core/query_items.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';
import 'package:rick/features/character/presentation/character_list_page/bloc/character_query_cubit.dart';

typedef FetcherChange = Function(LoadState state, QueryItems<CharacterEntity>? data);

class CharacterFetcher {
  CharacterFilter _filter = CharacterFilter.empty();
  int _latestFetchID = 0;
  QueryItems<CharacterEntity>? _items;
  final FetcherChange _stateChangedCallback;

  CharacterFetcher(FetcherChange callback) : _stateChangedCallback = callback;

  Future<void> fetch({CharacterFilter? filter, Duration? debounceDuration}) async {
    if (filter != null && _filter != filter) _changeFilter(filter);
    if (_items != null && _items!.hasMorePages == false) return;

    _stateChangedCallback(LoadState.loading, _items);
    _latestFetchID++;
    final fetchID = _latestFetchID;

    if (debounceDuration != null) {
      await Future.delayed(debounceDuration);
      if (fetchID != _latestFetchID) return;
    }

    if (_items == null) {
      _fetchFirst(fetchID);
    } else {
      _fetchMore(fetchID);
    }
  }

  void _changeFilter(CharacterFilter filter) {
    _filter = filter;
    _items = null;
  }

  Future<void> _fetchFirst(int fetchID) async {
    final repo = sl<CharacterRepository>();
    final result = await repo.getCharacters(page: 1, filter: _filter);

    if (_latestFetchID != fetchID) return;
    result.bimap(
      (l) => _stateChangedCallback(LoadState.error, null),
      (r) {
        _items = r;
        _stateChangedCallback(LoadState.data, _items);
      },
    );
  }

  Future<void> _fetchMore(int fetchID) async {
    final repo = sl<CharacterRepository>();
    final result = await repo.getCharacters(page: _items!.currentPage + 1, filter: _filter);

    if (_latestFetchID != fetchID) return;
    result.bimap(
      (l) => _stateChangedCallback(LoadState.error, _items),
      (r) {
        _items = _items!.merge(r);
        _stateChangedCallback(LoadState.data, _items);
      },
    );
  }
}
