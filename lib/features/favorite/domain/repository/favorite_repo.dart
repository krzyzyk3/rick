import 'dart:async';

import 'package:rick/features/character/domain/model/character_entity.dart';

class FavoriteChangedArgs {
  FavoriteChangedArgs({
    required this.characterID,
    required this.isFavorite,
    this.character,
  });

  String characterID;
  CharacterEntity? character;
  bool isFavorite;
}

abstract class FavoriteRepo {
  StreamController<FavoriteChangedArgs> get favoriteStream;

  List<CharacterEntity> getAllFavoriteCharacters();

  bool isFavorite(CharacterEntity character);

  void setFavorite(CharacterEntity character, bool favorite);
}
