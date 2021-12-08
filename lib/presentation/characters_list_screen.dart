import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick n' Morty Characters"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Char 1'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            leading: const Text('# 1'),
            onTap: () {
              Navigator.pushNamed(context, CharacterScreen.route);
            },
          );
        },
        itemCount: 10,
      ),
    );
  }
}
