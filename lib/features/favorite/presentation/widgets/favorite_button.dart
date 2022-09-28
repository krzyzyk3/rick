import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<FavoriteCubit>().flipFavorite(character),
      child: BlocBuilder<FavoriteCubit, List<CharacterEntity>>(
        buildWhen: (lastCharacters, newCharacters) {
          // Kinda bad, since FavoriteRepo sends info on which character got their favorite state changed
          // so using contains here is suboptimal, but idk how to code it better
          // I almost want to create another cubit, which would just notify about which character changed
          return lastCharacters.contains(character) != newCharacters.contains(character);
        },
        builder: (context, characters) {
          if (characters.contains(character)) {
            return const Icon(Icons.star, size: 40);
          } else {
            return const Icon(Icons.star_outline, size: 40);
          }
        },
      ),
    );
  }
}
