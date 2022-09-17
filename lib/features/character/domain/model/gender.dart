enum Gender { male, female, genderless, unknown }

extension GenderExt on Gender {
  String get name => toString().split('.')[1];
}
