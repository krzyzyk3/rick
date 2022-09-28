// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterEntityAdapter extends TypeAdapter<CharacterEntity> {
  @override
  final int typeId = 0;

  @override
  CharacterEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      status: fields[2] as CharacterStatus,
      gender: fields[3] as Gender,
      imgUrl: fields[4] as String,
      species: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.imgUrl)
      ..writeByte(5)
      ..write(obj.species);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CharacterStatusAdapter extends TypeAdapter<CharacterStatus> {
  @override
  final int typeId = 1;

  @override
  CharacterStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CharacterStatus.alive;
      case 1:
        return CharacterStatus.dead;
      case 2:
        return CharacterStatus.unknown;
      default:
        return CharacterStatus.alive;
    }
  }

  @override
  void write(BinaryWriter writer, CharacterStatus obj) {
    switch (obj) {
      case CharacterStatus.alive:
        writer.writeByte(0);
        break;
      case CharacterStatus.dead:
        writer.writeByte(1);
        break;
      case CharacterStatus.unknown:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GenderAdapter extends TypeAdapter<Gender> {
  @override
  final int typeId = 2;

  @override
  Gender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return Gender.male;
      case 2:
        return Gender.female;
      case 3:
        return Gender.genderless;
      case 4:
        return Gender.unknown;
      default:
        return Gender.male;
    }
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    switch (obj) {
      case Gender.male:
        writer.writeByte(1);
        break;
      case Gender.female:
        writer.writeByte(2);
        break;
      case Gender.genderless:
        writer.writeByte(3);
        break;
      case Gender.unknown:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
