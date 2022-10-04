import 'dart:async';

import 'package:rick/features/character/domain/model/character_entity.dart';

abstract class FavoriteRepo {
  Stream<List<CharacterEntity>> get favoriteStream;

  List<CharacterEntity> getAllFavoriteCharacters();

  bool isFavorite(CharacterEntity character);

  void flipFavorite(CharacterEntity character);
}
