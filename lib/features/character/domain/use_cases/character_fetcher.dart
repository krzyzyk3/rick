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

  // If during fetch, another fetch is called, cancels the first one by returning without callback
  Future<void> fetch({Duration? debounceDuration}) async {
    if (_items != null && _items!.hasMorePages == false) return;

    int fetchID = _getNewFetchID();
    _stateChangedCallback(LoadState.loading, _items);

    await _waitDebounce(debounceDuration);
    if (_isFetchOutdated(fetchID)) return;

    final repo = sl<CharacterRepository>();
    int page = getNextPage();
    final result = await repo.getCharacters(page: page, filter: _filter);
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
    if (filter != filter) {
      _filter = filter;
      _items = null;
      _latestFetchID++;
    }
  }

  int _getNewFetchID() {
    _latestFetchID++;
    return _latestFetchID; // Each fetch request gets unique fetchID, used for dismissing outdated fetches
  }

  bool _isFetchOutdated(int fetchID) {
    return fetchID != _latestFetchID;
  }

  Future<void> _waitDebounce(Duration? duration) async {
    if (duration != null) await Future.delayed(duration);
  }

  int getNextPage() {
    if (_items != null) {
      return _items!.currentPage + 1;
    } else {
      return 1;
    }
  }
}
