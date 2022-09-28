import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/favorite/domain/repository/favorite_repo.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    Key? key,
    required this.character,
  }) : super(key: key);

  final CharacterEntity character;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;
  late final FavoriteRepo favoriteRepo;
  late final StreamSubscription streamSubscription;

  @override
  void initState() {
    super.initState();
    favoriteRepo = sl();
    _isFavorite = favoriteRepo.isFavorite(widget.character);
    streamSubscription = favoriteRepo.favoriteStream.stream.listen(_onFavoriteChanged);
  }

  void _onFavoriteChanged(FavoriteChangedArgs args) {
    if (args.characterID == widget.character.id) {
      setState(() => _isFavorite = args.isFavorite);
    }
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => favoriteRepo.setFavorite(widget.character, !_isFavorite),
      child: Builder(
        builder: (context) {
          return _isFavorite ? const Icon(Icons.star, size: 40) : const Icon(Icons.star_outline, size: 40);
        },
      ),
    );
  }
}
