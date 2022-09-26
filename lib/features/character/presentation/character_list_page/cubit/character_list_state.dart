part of '../cubit/character_list_cubit.dart';

@freezed
class CharacterListState with _$CharacterListState {
  factory CharacterListState.data({
    required QueryItems<CharacterEntity> characters,
    required bool isLoading,
  }) = Data;
  factory CharacterListState.loading() = Loading;
  factory CharacterListState.error() = Error;
}
