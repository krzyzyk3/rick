part of 'character_entity.dart';

@HiveType(typeId: 1)
enum CharacterStatus {
  @HiveField(0)
  alive,
  @HiveField(1)
  dead,
  @HiveField(2)
  unknown,
}

extension CharacterStatusExt on CharacterStatus {
  String get name => toString().split('.')[1];
}
