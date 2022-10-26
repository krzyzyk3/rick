import 'package:flutter/material.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterEntity character = ModalRoute.of(context)!.settings.arguments as CharacterEntity;

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          Image.network(character.imgUrl),
          Text(character.name),
          Text('Species: ${character.species}'),
          Text('Location: ${character.lastLocation.name}'),
          Text('Origin: ${character.origin.name}'),
          Text('Origin: ${character.origin.name}'),
          Text('Episodes with ${character.name}:', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
