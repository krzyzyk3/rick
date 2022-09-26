import 'package:dartz/dartz.dart';
import 'package:rick/core/failure.dart';
import 'package:rick/core/query_items.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/domain/model/character_filter.dart';

abstract class CharacterRepository {
  Future<Either<Failure, QueryItems<CharacterEntity>>> getCharacters({required int page, CharacterFilter? filter});
}
