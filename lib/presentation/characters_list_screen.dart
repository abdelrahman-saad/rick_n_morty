import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/business_logic/cubit/character_cubit.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<CharacterCubit>(context).fetchData();
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Rick n' Morty Characters"),
      ),
        body:
        BlocBuilder<CharacterCubit,CharacterState>(

        builder: (context, state) {
          if(state.characters.isEmpty){
            return const Center(child:  CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.characters[index].name),
                contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                leading: Text(state.characters[index].id.toString()),
                onTap: () {
                  BlocProvider.of<CharacterCubit>(context).updateIndex(index);
                  Navigator.pushNamed(context, CharacterScreen.route);
                },
              );
            },
            itemCount: state.characters.length,
            // itemCount: 10,
          );
        },

      )
    );
  }
}
