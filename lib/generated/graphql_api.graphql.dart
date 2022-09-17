// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

mixin CharacterMixin {
  @JsonKey(name: '__typename')
  String? $$typename;
  late String name;
  late String status;
  late String gender;
  late String image;
  late String id;
  late String species;
}

@JsonSerializable(explicitToJson: true)
class Characters$Query$Characters$Info extends JsonSerializable
    with EquatableMixin {
  Characters$Query$Characters$Info();

  factory Characters$Query$Characters$Info.fromJson(
          Map<String, dynamic> json) =>
      _$Characters$Query$Characters$InfoFromJson(json);

  int? pages;

  @override
  List<Object?> get props => [pages];
  @override
  Map<String, dynamic> toJson() =>
      _$Characters$Query$Characters$InfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Characters$Query$Characters$Results extends JsonSerializable
    with EquatableMixin, CharacterMixin {
  Characters$Query$Characters$Results();

  factory Characters$Query$Characters$Results.fromJson(
          Map<String, dynamic> json) =>
      _$Characters$Query$Characters$ResultsFromJson(json);

  @override
  List<Object?> get props =>
      [$$typename, name, status, gender, image, id, species];
  @override
  Map<String, dynamic> toJson() =>
      _$Characters$Query$Characters$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Characters$Query$Characters extends JsonSerializable with EquatableMixin {
  Characters$Query$Characters();

  factory Characters$Query$Characters.fromJson(Map<String, dynamic> json) =>
      _$Characters$Query$CharactersFromJson(json);

  late Characters$Query$Characters$Info info;

  late List<Characters$Query$Characters$Results> results;

  @override
  List<Object?> get props => [info, results];
  @override
  Map<String, dynamic> toJson() => _$Characters$Query$CharactersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Characters$Query extends JsonSerializable with EquatableMixin {
  Characters$Query();

  factory Characters$Query.fromJson(Map<String, dynamic> json) =>
      _$Characters$QueryFromJson(json);

  late Characters$Query$Characters characters;

  @override
  List<Object?> get props => [characters];
  @override
  Map<String, dynamic> toJson() => _$Characters$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FilterCharacter extends JsonSerializable with EquatableMixin {
  FilterCharacter(
      {this.name, this.status, this.species, this.type, this.gender});

  factory FilterCharacter.fromJson(Map<String, dynamic> json) =>
      _$FilterCharacterFromJson(json);

  String? name;

  String? status;

  String? species;

  String? type;

  String? gender;

  @override
  List<Object?> get props => [name, status, species, type, gender];
  @override
  Map<String, dynamic> toJson() => _$FilterCharacterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CharactersArguments extends JsonSerializable with EquatableMixin {
  CharactersArguments({this.page, this.filter});

  @override
  factory CharactersArguments.fromJson(Map<String, dynamic> json) =>
      _$CharactersArgumentsFromJson(json);

  final int? page;

  final FilterCharacter? filter;

  @override
  List<Object?> get props => [page, filter];
  @override
  Map<String, dynamic> toJson() => _$CharactersArgumentsToJson(this);
}

final CHARACTERS_QUERY_DOCUMENT_OPERATION_NAME = 'Characters';
final CHARACTERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'Characters'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'page')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'filter')),
            type: NamedTypeNode(
                name: NameNode(value: 'FilterCharacter'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'characters'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'page'),
                  value: VariableNode(name: NameNode(value: 'page'))),
              ArgumentNode(
                  name: NameNode(value: 'filter'),
                  value: VariableNode(name: NameNode(value: 'filter')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'info'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'pages'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              FieldNode(
                  name: NameNode(value: 'results'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'Character'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'Character'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'Character'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'species'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class CharactersQuery
    extends GraphQLQuery<Characters$Query, CharactersArguments> {
  CharactersQuery({required this.variables});

  @override
  final DocumentNode document = CHARACTERS_QUERY_DOCUMENT;

  @override
  final String operationName = CHARACTERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final CharactersArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Characters$Query parse(Map<String, dynamic> json) =>
      Characters$Query.fromJson(json);
}
