import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/presentation/widgets/character_list_view.dart';
import 'package:rick/features/favorite/presentation/pages/cubit/favorite_page_cubit.dart';
import 'package:rick/features/favorite/presentation/pages/cubit/favorite_page_state.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritePageCubit(repo: sl()),
      child: BlocBuilder<FavoritePageCubit, FavoritePageState>(
        builder: (context, favoriteCharactersState) {
          return favoriteCharactersState.when(
            data: (characters) {
              return CharacterListView(
                characters: characters,
                isLoading: false,
                hasMoreData: false,
              );
            },
            empty: () => const Center(child: Text('Make any character favorite to see it here')),
          );
        },
      ),
    );
  }
}
