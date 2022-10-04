import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';

part 'favorite_page_state.freezed.dart';

@freezed
class FavoritePageState with _$FavoritePageState {
  factory FavoritePageState.data({required List<CharacterEntity> favorite}) = Data;
  factory FavoritePageState.empty() = Empty;
}
