import 'package:rick/dependencies.dart';
import 'package:rick/features/character/data/repository/character_repository_impl.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';
import 'package:rick/networking/graphql_network_manager.dart';

Future<void> setup() async {
  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(networkManager: sl<GraphqlNetworkManager>()));
}
