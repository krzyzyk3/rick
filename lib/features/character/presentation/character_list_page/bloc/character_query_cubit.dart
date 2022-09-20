import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/use_cases/character_fetcher.dart';

part 'character_query_cubit.freezed.dart';
part 'character_query_state.dart';

enum LoadState { data, loading, error }

const Duration debounceDuration = Duration(milliseconds: 200);

class CharacterListCubit extends Cubit<CharacterListState> {
  late final CharacterFetcher fetcher;

  CharacterListCubit() : super(CharacterListState.loading()) {
    fetcher = CharacterFetcher(_fetchCallback);
    fetcher.fetch();
  }

  void fetchMore({bool debounce = false}) {
    if (debounce) {
      fetcher.fetch(debounceDuration: debounceDuration);
    } else {
      fetcher.fetch();
    }
  }

  void setFilter(CharacterFilter filter) {
    fetcher.fetch(filter: filter);
  }

  _fetchCallback(LoadState state, QueryItems<CharacterEntity>? data) {
    switch (state) {
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
}
