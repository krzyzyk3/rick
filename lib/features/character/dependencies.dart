import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/data/repository/character_repository_impl.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';
import 'package:rick/features/character/domain/use_cases/character_fetcher.dart';
import 'package:rick/features/character/presentation/character_list_page/cubit/character_list_cubit.dart';
import 'package:rick/features/location/domain/model/location.dart';

Future<void> setup() async {
  Hive.registerAdapter(CharacterStatusAdapter());
  Hive.registerAdapter(GenderAdapter());
  Hive.registerAdapter(CharacterEntityAdapter());
  Hive.registerAdapter(LocationAdapter());
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(networkManager: sl()));
  sl.registerLazySingleton<CharacterFetcher>(() => CharacterFetcher(characterRepository: sl()));
  sl.registerFactory(() => CharacterListCubit(fetcher: sl()));
}
