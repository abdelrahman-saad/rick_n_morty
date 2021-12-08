import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/presentation/characters_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rick n\' Morty Character',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CharactersListScreen(),
          CharacterScreen.route: (context) => const CharacterScreen()
        });
  }
}
