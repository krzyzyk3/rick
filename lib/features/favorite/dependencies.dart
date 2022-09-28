import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/data/repository/favorite_repo_impl.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

Future<void> setup() async {
  final box = await Hive.openBox<CharacterEntity>('favorite');
  sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl(box));
}
