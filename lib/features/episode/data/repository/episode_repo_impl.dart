import 'package:dartz/dartz.dart';
import 'package:rick/core/failure.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/episode/domain/model/episode.dart';
import 'package:rick/features/episode/domain/repository/episode_repo.dart';
import 'package:rick/generated/graphql_api.graphql.dart';
import 'package:rick/networking/graphql_network_manager.dart';

class EpisodeRepoImpl implements EpisodeRepo {
  EpisodeRepoImpl({required GraphqlNetworkManager networkManager}) : _networkManager = networkManager;

  final GraphqlNetworkManager _networkManager;

  @override
  Future<Either<Failure, List<Episode>>> loadEpisodesForCharacter(CharacterEntity character) async {
    final result = await _networkManager.query(CharacterEpisodesQuery(
      variables: CharacterEpisodesArguments(ID: character.id),
    ));
    return result.fold(
      (l) => Left(l),
      (r) {
        if (r.character == null) return Left(ServerFailure()); // Could be invalid ID
        return Right(r.character!.episode.map((e) => Episode.fromGraphQL(e)).toList());
      },
    );
  }
}
