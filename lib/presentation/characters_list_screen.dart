import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_n_morty/business_logic/cubit/internet_cubit.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/business_logic/cubit/character_cubit.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharacterCubit>(context).fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick n' Morty Characters"),
      ),
      body: BlocListener<InternetCubit, InternetState>(
        listener: (_, state) {
          if (state is InternetFailed) {
            // _.read<InternetCubit>().emitInternetFailed();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No Internet Connection'),
              duration: Duration(seconds: 1),
            ));
          } else if (state is InternetSuccess) {
            // _.read<InternetCubit>().emitInternetConnected();

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Back Online'),
              duration: Duration(seconds: 1),
            ));
          }
        },
        child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (_, state) {
            if (state.characters.isEmpty) {
              var connectionState = context.read<InternetCubit>();
              if(connectionState.state is InternetFailed){
                // connectionState.emitInternetFailed();
                return const Center(child: Text('No Internet Connection please Check your connection'));
              }
              // connectionState.emitInternetConnected();
             else if(connectionState.state is InternetLoading){
                return const Center(child: CircularProgressIndicator());
              }

            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.characters[index].name),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  leading: Text(state.characters[index].id.toString()),
                  onTap: () {
                    BlocProvider.of<CharacterCubit>(context)
                        .updateIndex(index);
                    Navigator.pushNamed(context, CharacterScreen.route);
                  },
                );
              },
              itemCount: state.characters.length,
              // itemCount: 10,
            );
          },
        ),
      ),
    );
  }
}
