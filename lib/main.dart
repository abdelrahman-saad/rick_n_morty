import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_n_morty/business_logic/models/character.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/presentation/characters_list_screen.dart';
import 'package:rick_n_morty/business_logic/cubit/character_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
late  ConnectivityResult connectionResult;
Future<void> main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  connectionResult = await Connectivity().checkConnectivity();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static ConnectivityResult getConnectivity(){
    return connectionResult;
  }
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
