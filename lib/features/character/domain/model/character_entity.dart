import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick/features/location/domain/model/location.dart';
import 'package:rick/generated/graphql_api.graphql.dart';

part 'character_status.dart';
part 'gender.dart';
part 'character_entity.g.dart';

@HiveType(typeId: 0)
class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.imgUrl,
    required this.species,
    required this.lastLocation,
    required this.origin,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final CharacterStatus status;

  @HiveField(3)
  final Gender gender;

  @HiveField(4)
  final String imgUrl;

  @HiveField(5)
  final String species;

  @HiveField(6)
  final Location lastLocation;

  @HiveField(7)
  final Location origin;

  factory CharacterEntity.fromGraphql(CharacterMixin mixin) {
    return CharacterEntity(
      id: mixin.id,
      name: mixin.name,
      status: _graphqlStatusToCharacterStatus(mixin.status),
      gender: _graphqlGenderToGender(mixin.gender),
      imgUrl: mixin.image,
      species: mixin.species,
      lastLocation: Location.fromGraphQL(mixin.location as LocationMixin),
      origin: Location.fromGraphQL(mixin.origin as LocationMixin),
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
