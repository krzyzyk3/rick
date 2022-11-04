part of 'character_episode_list_cubit.dart';

@freezed
class CharacterEpisodeListState with _$CharacterEpisodeListState {
  factory CharacterEpisodeListState.data({required List<Episode> episodes}) = Data;
  factory CharacterEpisodeListState.error() = Error;
  factory CharacterEpisodeListState.loading() = Loading;
}
