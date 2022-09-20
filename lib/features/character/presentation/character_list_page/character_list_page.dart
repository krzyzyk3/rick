import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/features/character/presentation/character_list_page/bloc/character_query_cubit.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListCubit, CharacterListState>(
      builder: (context, state) {
        return state.map(
          data: (args) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: context.read<CharacterListCubit>().fetchMore,
                  child: const Text("Load more"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: args.characters.items.length,
                    itemBuilder: (context, index) {
                      return Text(args.characters.items[index].name);
                    },
                  ),
                ),
              ],
            );
          },
          loading: (_) => const Text("Loading"),
          error: (_) => const Text("Error"),
        );
      },
    );
  }
}
