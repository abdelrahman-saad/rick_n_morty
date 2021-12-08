import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/presentation/characters_list_screen.dart';
import 'package:rick_n_morty/presentation/cubit/character_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharacterCubit>(
      create: (_)=>CharacterCubit(),
      child: MaterialApp(
          title: 'Rick n\' Morty Character',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // initialRoute: '/',
          home: CharactersListScreen(),
          routes: {

            CharacterScreen.route: (context) => const CharacterScreen()
          }),
    );
  }
}
