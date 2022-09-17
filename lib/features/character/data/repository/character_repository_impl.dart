import 'package:dartz/dartz.dart';
import 'package:rick/core/failure.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';
import 'package:rick/features/character/domain/repository/character_repository.dart';
import 'package:rick/features/character/domain/repository/characters_query_result.dart';
import 'package:rick/generated/graphql_api.graphql.dart';
import 'package:rick/networking/graphql_network_manager.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  CharacterRepositoryImpl({required networkManager}) : _networkManager = networkManager;

  final GraphqlNetworkManager _networkManager;

  @override
  Future<Either<Failure, QueryItems<CharacterEntity>>> getCharacters({
    required int page,
    CharacterFilter? filter,
  }) async {
    final result = await _networkManager.query(CharactersQuery(
      variables: CharactersArguments(
        page: page,
        filter: filter?.graphqlFilter,
      ),
    ));
    return result.fold(
      (l) => Left(l),
      (r) {
        final characters = r.characters.results.map((e) => CharacterEntity.fromGraphql(e)).toList();
        return Right(QueryItems<CharacterEntity>(
          items: characters,
          totalPages: r.characters.info.pages ?? 0,
          currentPage: page,
        ));
      },
    );
  }
}
