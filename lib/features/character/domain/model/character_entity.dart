import 'package:equatable/equatable.dart';
import 'package:rick/features/character/domain/model/character_status.dart';
import 'package:rick/features/character/domain/model/gender.dart';
import 'package:rick/generated/graphql_api.graphql.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final CharacterStatus status;
  final Gender gender;
  final String imgUrl;
  final String species;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.imgUrl,
    required this.species,
  });

  factory CharacterEntity.fromGraphql(CharacterMixin mixin) {
    return CharacterEntity(
      id: mixin.id,
      name: mixin.name,
      status: _graphqlStatusToCharacterStatus(mixin.status),
      gender: _graphqlGenderToGender(mixin.gender),
      imgUrl: mixin.image,
      species: mixin.species,
    );
  }

  factory CharacterEntity.fromJson(Map<String, dynamic> json) {
    return CharacterEntity.fromGraphql(Characters$Query$Characters$Results.fromJson(json));
  }

  static CharacterStatus _graphqlStatusToCharacterStatus(String status) {
    return CharacterStatus.values.firstWhere((element) => element.name == status.toLowerCase());
  }

  static Gender _graphqlGenderToGender(String gender) {
    return Gender.values.firstWhere((element) => element.name == gender.toLowerCase());
  }

  @override
  List<Object?> get props {
    return [id, name, status, gender, imgUrl, species];
  }
}
