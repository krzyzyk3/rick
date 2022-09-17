import 'package:equatable/equatable.dart';
import 'package:rick/generated/graphql_api.graphql.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';

class CharactersQueryResult {
  final List<CharacterEntity> characters;
  final int pages;

  const CharactersQueryResult({
    required this.characters,
    required this.pages,
  });

  factory CharactersQueryResult.fromGraphql(Characters$Query$Characters data) {
    return CharactersQueryResult(
      characters: data.results.map((e) => CharacterEntity.fromGraphql(e)).toList(),
      pages: data.info.pages ?? 0,
    );
  }
}
