enum CharacterStatus {
  alive,
  dead,
  unknown,
}

extension CharacterStatusExt on CharacterStatus {
  String get name => toString().split('.')[1];
}
