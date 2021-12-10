import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_n_morty/business_logic/cubit/internet_cubit.dart';
import 'package:rick_n_morty/business_logic/models/character.dart';
import 'package:rick_n_morty/presentation/character_screen.dart';
import 'package:rick_n_morty/presentation/characters_list_screen.dart';
import 'package:rick_n_morty/business_logic/cubit/character_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CharacterAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterCubit>(
          create: (context) => CharacterCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        )
      ],
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
