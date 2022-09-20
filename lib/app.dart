import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick/features/character/presentation/character_list_page/bloc/character_query_cubit.dart';
import 'package:rick/features/character/presentation/character_list_page/character_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (_) => CharacterListCubit(),
            child: const CharacterListPage(),
          ),
        ),
      ),
    );
  }
}
