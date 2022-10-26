// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Characters$Query$Characters$Info _$Characters$Query$Characters$InfoFromJson(
        Map<String, dynamic> json) =>
    Characters$Query$Characters$Info()..pages = json['pages'] as int?;

Map<String, dynamic> _$Characters$Query$Characters$InfoToJson(
    Characters$Query$Characters$Info instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pages', instance.pages);
  return val;
}

Characters$Query$Characters$Results
    _$Characters$Query$Characters$ResultsFromJson(Map<String, dynamic> json) =>
        Characters$Query$Characters$Results()
          ..$$typename = json['__typename'] as String?
          ..name = json['name'] as String
          ..status = json['status'] as String
          ..gender = json['gender'] as String
          ..image = json['image'] as String
          ..id = json['id'] as String
          ..species = json['species'] as String
          ..origin = json['origin'] == null
              ? null
              : CharacterMixin$Origin.fromJson(
                  json['origin'] as Map<String, dynamic>)
          ..location = json['location'] == null
              ? null
              : CharacterMixin$Location.fromJson(
                  json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$Characters$Query$Characters$ResultsToJson(
    Characters$Query$Characters$Results instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  val['name'] = instance.name;
  val['status'] = instance.status;
  val['gender'] = instance.gender;
  val['image'] = instance.image;
  val['id'] = instance.id;
  val['species'] = instance.species;
  writeNotNull('origin', instance.origin?.toJson());
  writeNotNull('location', instance.location?.toJson());
  return val;
}

Characters$Query$Characters _$Characters$Query$CharactersFromJson(
        Map<String, dynamic> json) =>
    Characters$Query$Characters()
      ..info = Characters$Query$Characters$Info.fromJson(
          json['info'] as Map<String, dynamic>)
      ..results = (json['results'] as List<dynamic>)
          .map((e) => Characters$Query$Characters$Results.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Characters$Query$CharactersToJson(
        Characters$Query$Characters instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

Characters$Query _$Characters$QueryFromJson(Map<String, dynamic> json) =>
    Characters$Query()
      ..characters = Characters$Query$Characters.fromJson(
          json['characters'] as Map<String, dynamic>);

Map<String, dynamic> _$Characters$QueryToJson(Characters$Query instance) =>
    <String, dynamic>{
      'characters': instance.characters.toJson(),
    };

CharacterMixin$Origin _$CharacterMixin$OriginFromJson(
        Map<String, dynamic> json) =>
    CharacterMixin$Origin()
      ..$$typename = json['__typename'] as String?
      ..id = json['id'] as String?
      ..name = json['name'] as String
      ..type = json['type'] as String?
      ..dimension = json['dimension'] as String?;

Map<String, dynamic> _$CharacterMixin$OriginToJson(
    CharacterMixin$Origin instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('type', instance.type);
  writeNotNull('dimension', instance.dimension);
  return val;
}

CharacterMixin$Location _$CharacterMixin$LocationFromJson(
        Map<String, dynamic> json) =>
    CharacterMixin$Location()
      ..$$typename = json['__typename'] as String?
      ..id = json['id'] as String?
      ..name = json['name'] as String
      ..type = json['type'] as String?
      ..dimension = json['dimension'] as String?;

Map<String, dynamic> _$CharacterMixin$LocationToJson(
    CharacterMixin$Location instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__typename', instance.$$typename);
  writeNotNull('id', instance.id);
  val['name'] = instance.name;
  writeNotNull('type', instance.type);
  writeNotNull('dimension', instance.dimension);
  return val;
}

FilterCharacter _$FilterCharacterFromJson(Map<String, dynamic> json) =>
    FilterCharacter(
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$FilterCharacterToJson(FilterCharacter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('status', instance.status);
  writeNotNull('species', instance.species);
  writeNotNull('type', instance.type);
  writeNotNull('gender', instance.gender);
  return val;
}

CharactersArguments _$CharactersArgumentsFromJson(Map<String, dynamic> json) =>
    CharactersArguments(
      page: json['page'] as int?,
      filter: json['filter'] == null
          ? null
          : FilterCharacter.fromJson(json['filter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersArgumentsToJson(CharactersArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('page', instance.page);
  writeNotNull('filter', instance.filter?.toJson());
  return val;
}
