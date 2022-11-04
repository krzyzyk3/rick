import 'package:flutter/material.dart';
import 'package:rick/features/episode/domain/model/episode.dart';
import 'package:rick/features/episode/presentation/widgets/episode_list_item.dart';

// I'll make it able to load more things, when I need to
class EpisodeList extends StatelessWidget {
  const EpisodeList({Key? key, required this.episodes}) : super(key: key);

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) => EpisodeItem(episode: episodes[index]),
    );
  }
}
