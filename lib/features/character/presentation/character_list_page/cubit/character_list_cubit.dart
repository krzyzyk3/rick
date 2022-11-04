import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/core/enums.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/use_cases/character_fetcher.dart';

part 'character_list_cubit.freezed.dart';
part 'character_list_state.dart';

const Duration debounceDuration = Duration(milliseconds: 200);

class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit({required CharacterFetcher fetcher})
      : _fetcher = fetcher,
        super(CharacterListState.loading()) {
    streamSubscription = _fetcher.fetchStateStreamController.stream.listen(_onFetchStateChange);
    fetchMore(debounce: false);
  }

  late final CharacterFetcher _fetcher;
  late final StreamSubscription streamSubscription;

  void setFilter(CharacterFilter filter) {
    _fetcher.setFilter(filter);
    fetchMore(debounce: true);
  }

  void fetchMore({bool debounce = false}) {
    _fetcher.fetch(debounceDuration: debounce ? debounceDuration : null);
  }

  void _onFetchStateChange(CharacterFetcherResult fetchState) {
    final data = fetchState.data;
    switch (fetchState.state) {
      case LoadState.data:
        assert(data != null);
        emit(CharacterListState.data(characters: data!, isLoading: false));
        break;
      case LoadState.loading:
        if (data == null) {
          emit(CharacterListState.loading());
        } else {
          emit(CharacterListState.data(characters: data, isLoading: true));
        }
        break;
      case LoadState.error:
        emit(CharacterListState.error());
        break;
    }
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
