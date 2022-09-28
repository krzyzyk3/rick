import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

class FavoriteCubit extends Cubit<List<CharacterEntity>> {
  FavoriteCubit({FavoriteRepo? repo}) : super([]) {
    _favoriteRepo = repo ?? sl();
    _streamSubscription = _favoriteRepo.favoriteStream.stream.listen(_onFavoriteChanged);
  }

  late final StreamSubscription _streamSubscription;
  late final FavoriteRepo _favoriteRepo;

  void _onFavoriteChanged(FavoriteChangedArgs args) {
    emit(_favoriteRepo.getAllFavoriteCharacters());
  }

  bool isFavorite(CharacterEntity character) => _favoriteRepo.isFavorite(character);

  void flipFavorite(CharacterEntity character) => _favoriteRepo.setFavorite(character, !isFavorite(character));

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
