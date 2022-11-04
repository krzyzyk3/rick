import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/episode/presentation/character_episode_list/cubit/character_episode_list_cubit.dart';
import 'package:rick/features/episode/presentation/widgets/episode_list.dart';

class CharacterEpisodeList extends StatelessWidget {
  const CharacterEpisodeList({Key? key, required this.character}) : super(key: key);

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CharacterEpisodeListCubit(character: character),
      child: BlocBuilder<CharacterEpisodeListCubit, CharacterEpisodeListState>(
        builder: (BuildContext context, CharacterEpisodeListState state) {
          return state.map(
            error: (_) => const Text("Oh shit, an error! Too bad you can't try again you little piss boy"),
            loading: (_) => const Text("Loading as shit boiiiii"),
            data: (data) => EpisodeList(episodes: data.episodes),
          );
        },
      ),
    );
  }
}
