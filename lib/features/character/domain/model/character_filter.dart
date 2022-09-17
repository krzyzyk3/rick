import 'package:equatable/equatable.dart';
import 'package:rick/features/character/domain/model/character_status.dart';
import 'package:rick/features/character/domain/model/gender.dart';
import 'package:rick/generated/graphql_api.graphql.dart';

class CharacterFilter extends Equatable {
  final String? name;
  final CharacterStatus? characterStatus;
  final Gender? gender;

  const CharacterFilter({
    this.name,
    this.characterStatus,
    this.gender,
  });

  FilterCharacter get graphqlFilter {
    return FilterCharacter(
      name: name,
      status: characterStatus?.name,
      gender: gender?.name,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        characterStatus,
        gender,
      ];
}
