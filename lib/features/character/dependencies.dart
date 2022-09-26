import 'package:rick/dependencies.dart';
import 'package:rick/features/character/data/repository/character_repository_impl.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';
import 'package:rick/features/character/domain/use_cases/character_fetcher.dart';
import 'package:rick/features/character/presentation/character_list_page/cubit/character_list_cubit.dart';

Future<void> setup() async {
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(networkManager: sl()));
  sl.registerLazySingleton<CharacterFetcher>(() => CharacterFetcher(characterRepository: sl()));
  sl.registerFactory(() => CharacterListCubit(fetcher: sl()));
}
