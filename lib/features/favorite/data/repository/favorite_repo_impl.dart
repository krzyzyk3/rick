import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

class FavoriteRepoImpl with Disposable implements FavoriteRepo {
  FavoriteRepoImpl(this._favoriteBox) {
    _boxStreamSubscription = _favoriteBox.watch().listen(_onFavoriteBoxChange);
  }

  final Box<CharacterEntity> _favoriteBox;
  late final StreamSubscription _boxStreamSubscription;
  final StreamController<FavoriteChangedArgs> _favoriteStreamController = StreamController.broadcast();
  @override
  Stream<FavoriteChangedArgs> get favoriteStream => _favoriteStreamController.stream;

  @override
  List<CharacterEntity> getAllFavoriteCharacters() => List<CharacterEntity>.from(_favoriteBox.values);

  @override
  bool isFavorite(CharacterEntity character) => _favoriteBox.containsKey(character.id);

  @override
  void setFavorite(CharacterEntity character, bool favorite) {
    favorite ? _favoriteBox.put(character.id, character) : _favoriteBox.delete(character.id);
  }

  void _onFavoriteBoxChange(BoxEvent event) {
    if (event.deleted) {
      _favoriteStreamController.add(FavoriteChangedArgs(
        characterID: event.key,
        isFavorite: false,
      ));
    } else {
      _favoriteStreamController.add(FavoriteChangedArgs(
        characterID: event.key,
        isFavorite: true,
        character: event.value,
      ));
    }
  }

  @override
  FutureOr onDispose() {
    _favoriteStreamController.close();
    _boxStreamSubscription.cancel();
  }
}
