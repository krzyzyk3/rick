import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/core/enums.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/use_cases/character_fetcher.dart';

part 'character_list_cubit.freezed.dart';
part 'character_list_state.dart';

const Duration debounceDuration = Duration(milliseconds: 200);

class CharacterListCubit extends Cubit<CharacterListState> {
  CharacterListCubit() : super(CharacterListState.loading()) {
    fetcher = CharacterFetcher(fetcherStateCallback: _fetchCallback, characterRepository: sl());
    fetchMore(debounce: false);
  }

  late final CharacterFetcher fetcher;

  void setFilter(CharacterFilter filter) {
    fetcher.setFilter(filter);
    fetchMore(debounce: true);
  }

  void fetchMore({bool debounce = false}) {
    fetcher.fetch(debounceDuration: debounce ? debounceDuration : null);
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
