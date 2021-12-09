import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/const.dart';
import 'package:rick_n_morty/business_logic/cubit/character_cubit.dart';
import 'package:rick_n_morty/main.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);
  static const String route = '/character';

  @override
  Widget build(BuildContext context) {
    // GraphQLService().getCharacters();

    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            title: BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) =>
                  Text(state.characters[state.index].name),
            ),
          ),
          body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: BlocBuilder<CharacterCubit, CharacterState>(
              builder: (context, state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyApp.getConnectivity() != ConnectivityResult.none?
                  Image.network(
                    state.characters[state.index].imageURL,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    height: MediaQuery.of(context).size.height * 0.4,

                  ):
                  const Text('No Connection Available so no Image Preview')
                  ,
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text('Name: ' + state.characters[state.index].name,
                      style: textStyle),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Status:  ' + state.characters[state.index].status,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Gender:  ' + state.characters[state.index].gender,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Location:  ' + state.characters[state.index].locationName,
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text('Origin:  ' + state.characters[state.index].origin,
                      style: textStyle),
                ],
              ),
            ),
          )),
    );
  }
}
