import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';
import 'package:rick/features/favorite/presentation/pages/cubit/favorite_page_state.dart';

class FavoritePageCubit extends Cubit<FavoritePageState> {
  FavoritePageCubit({required FavoriteRepo repo}) : super(FavoritePageState.empty()) {
    _favoriteRepo = repo;
    _streamSubscription = _favoriteRepo.favoriteStream.listen(_onFavoriteChanged);
    emitState(_favoriteRepo.getAllFavoriteCharacters());
  }

  late final StreamSubscription _streamSubscription;
  late final FavoriteRepo _favoriteRepo;

  void _onFavoriteChanged(List<CharacterEntity> newFavorites) {
    emitState(newFavorites);
  }

  void emitState(List<CharacterEntity> favorites) {
    if (favorites.isEmpty) emit(FavoritePageState.empty());

    final sorted = favorites.sorted((c1, c2) => int.parse(c1.id).compareTo(int.parse(c2.id)));
    emit(FavoritePageState.data(favorite: sorted));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
