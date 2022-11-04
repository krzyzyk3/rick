import 'package:dartz/dartz.dart';
import 'package:rick/core/failure.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/episode/domain/model/episode.dart';

abstract class EpisodeRepo {
  Future<Either<Failure, List<Episode>>> loadEpisodesForCharacter(CharacterEntity character);
}
