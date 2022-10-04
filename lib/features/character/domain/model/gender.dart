part of 'character_entity.dart';

@HiveType(typeId: 2)
enum Gender {
  @HiveField(0)
  male,
  @HiveField(1)
  female,
  @HiveField(2)
  genderless,
  @HiveField(3)
  unknown,
}

extension GenderExt on Gender {
  String get name => toString().split('.')[1];
}
