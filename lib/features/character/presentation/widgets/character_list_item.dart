import 'package:flutter/material.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';

class CharacterListItem extends StatelessWidget {
  final CharacterEntity character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print("${character.name} Pressed");
      },
      child: SizedBox(
        height: 90,
        child: Row(
          children: [
            Image.network(character.imgUrl),
            Text(character.name),
          ],
        ),
      ),
    );
  }
}
