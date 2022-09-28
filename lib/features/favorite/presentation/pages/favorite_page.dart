import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/features/character/domain/model/character_entity.dart';
import 'package:rick/features/character/presentation/widgets/character_list_view.dart';
import 'package:rick/features/favorite/presentation/cubit/favorite_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<CharacterEntity>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(child: Text('Make any character favorite to see it here'));
        } else {
          return CharacterListView(
            characters: state,
            isLoading: false,
            hasMoreData: false,
          );
        }
      },
    );
  }
}
