import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/data/repository/favorite_repo_impl.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

const String favoriteHiveBoxName = 'favorite';

Future<void> setup() async {
  await Hive.deleteBoxFromDisk(favoriteHiveBoxName);
  final box = await Hive.openBox<CharacterEntity>(favoriteHiveBoxName);
  sl.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImpl(box));
}
