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

  static const double iconSize = 40;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.read<FavoriteCubit>().flipFavorite(character),
      child: BlocBuilder<FavoriteCubit, List<String>>(
        buildWhen: (lastCharacters, newCharacters) {
          return lastCharacters.contains(character.id) != newCharacters.contains(character.id);
        },
        builder: (_, characters) => Icon(
          characters.contains(character.id) ? Icons.star : Icons.star_outline,
          size: iconSize,
        ),
      ),
    );
  }
}
