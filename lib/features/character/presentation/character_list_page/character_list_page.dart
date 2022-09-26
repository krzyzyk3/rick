import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/presentation/character_list_page/cubit/character_list_cubit.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<CharacterListCubit>(
          create: (_) => sl(),
          child: BlocBuilder<CharacterListCubit, CharacterListState>(
            builder: (context, state) {
              return state.map(
                loading: (_) => const Text("Loading"),
                error: (_) => const Text("Error"),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
