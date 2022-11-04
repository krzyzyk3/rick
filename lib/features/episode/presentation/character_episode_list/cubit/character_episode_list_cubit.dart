import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/episode/domain/model/episode.dart';
import 'package:rick/features/episode/domain/repository/episode_repo.dart';

part 'character_episode_list_cubit.freezed.dart';
part 'character_episode_list_state.dart';

class CharacterEpisodeListCubit extends Cubit<CharacterEpisodeListState> {
  CharacterEpisodeListCubit({required this.character}) : super(CharacterEpisodeListState.loading()) {
    episodeRepo = sl();
    _loadEpisodes();
  }

  final CharacterEntity character;
  late final EpisodeRepo episodeRepo;

  void tryLoadingAgain() => _loadEpisodes();

  void _loadEpisodes() {
    emit(CharacterEpisodeListState.loading());
    episodeRepo.loadEpisodesForCharacter(character).then(
          (result) => {
            result.fold(
              (left) => emit(CharacterEpisodeListState.error()),
              (right) => emit(CharacterEpisodeListState.data(episodes: right)),
            )
          },
        );
  }
}
