part of 'character_query_cubit.dart';

@freezed
class CharacterListState with _$CharacterQueryState {
  factory CharacterListState.data({
    required QueryItems<CharacterEntity> characters,
    required bool isLoading,
  }) = Data;
  factory CharacterListState.loading() = Loading;
  factory CharacterListState.error() = Error;
}
