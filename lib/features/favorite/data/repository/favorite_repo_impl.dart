import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

class FavoriteRepoImpl with Disposable implements FavoriteRepo {
  FavoriteRepoImpl(this._favorite) {
    _subscription = _favorite.watch().listen(_onFavoriteChange);
  }

  late final StreamSubscription _subscription;
  final Box<CharacterEntity> _favorite;
  @override
  StreamController<FavoriteChangedArgs> favoriteStream = StreamController.broadcast();

  @override
  List<CharacterEntity> getAllFavoriteCharacters() => List<CharacterEntity>.from(_favorite.keys);

  @override
  bool isFavorite(CharacterEntity character) => _favorite.containsKey(character.id);

  @override
  void setFavorite(CharacterEntity character, bool favorite) {
    favorite ? _favorite.put(character.id, character) : _favorite.delete(character.id);
  }

  void _onFavoriteChange(BoxEvent event) {
    if (event.deleted) {
      favoriteStream.add(FavoriteChangedArgs(characterID: event.key, isFavorite: false));
    } else {
      favoriteStream.add(FavoriteChangedArgs(characterID: event.key, isFavorite: true, character: event.value));
    }
  }

  @override
  FutureOr onDispose() => _subscription.cancel();
}
