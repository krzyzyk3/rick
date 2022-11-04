import 'package:flutter/material.dart';
import 'package:rick/core/navigation.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/presentation/widgets/favorite_button.dart';

class CharacterListItem extends StatelessWidget {
  final CharacterEntity character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, RouteName.character, arguments: character),
      child: SizedBox(
        height: 90,
        child: Row(
          children: [
            Image.network(character.imgUrl),
            Expanded(child: Text(character.name)),
            FavoriteButton(character: character),
          ],
        ),
      ),
    );
  }
}
