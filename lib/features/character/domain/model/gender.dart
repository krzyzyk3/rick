part of 'character_entity.dart';

@HiveType(typeId: 2)
enum Gender {
  @HiveField(1)
  male,
  @HiveField(2)
  female,
  @HiveField(3)
  genderless,
  @HiveField(4)
  unknown,
}

extension GenderExt on Gender {
  String get name => toString().split('.')[1];
}
