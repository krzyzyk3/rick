import 'package:rick/dependencies.dart';
import 'package:rick/features/episode/data/repository/episode_repo_impl.dart';
import 'package:rick/features/episode/domain/repository/episode_repo.dart';

void setup() {
  sl.registerLazySingleton<EpisodeRepo>(() => EpisodeRepoImpl(networkManager: sl()));
}
