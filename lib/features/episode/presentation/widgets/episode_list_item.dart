import 'package:flutter/material.dart';
import 'package:rick/features/episode/domain/model/episode.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({Key? key, required this.episode}) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(episode.name),
    );
  }
}
