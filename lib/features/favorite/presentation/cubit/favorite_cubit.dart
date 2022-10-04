import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

// I'm unsure about List<String> as the state but it'll work for now
class FavoriteCubit extends Cubit<List<String>> {
  FavoriteCubit({required this.favoriteRepo}) : super([]) {
    subscription = favoriteRepo.favoriteStream.listen(onFavoriteRepoChange);
    emit(favoriteRepo.getAllFavoriteCharacters().map((e) => e.id).toList());
  }

  final FavoriteRepo favoriteRepo;
  late final StreamSubscription subscription;

  void onFavoriteRepoChange(List<CharacterEntity> newCharacters) => emit(newCharacters.map((e) => e.id).toList());

  void flipFavorite(CharacterEntity character) => favoriteRepo.flipFavorite(character);

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
