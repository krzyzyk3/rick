import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/core/navigation.dart';
import 'package:rick/core/pages/main_page.dart';
import 'package:rick/dependencies.dart';
import 'package:rick/features/character/presentation/character_page/character_page.dart';
import 'package:rick/features/favorite/presentation/cubit/favorite_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteCubit>(
      create: (context) => FavoriteCubit(favoriteRepo: sl()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RouteName.main,
        routes: {
          RouteName.main: (_) => const MainPage(),
          RouteName.character: (_) => const CharacterPage(),
        },
      ),
    );
  }
}
