import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_n_morty/business_logic/models/character.dart';
import 'package:rick_n_morty/business_logic/services/graphql.dart';
import 'package:hive/hive.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterState( [], 0));
  GraphQLService service = GraphQLService();

  void fetchData() async {
    // var path = Directory.current.path;
    // Hive.init(path);

    var box = await Hive.openBox('characterBox');
    var connectivityResults = await (Connectivity().checkConnectivity());
    if (box.isEmpty &&
        (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile)){
      await initList();
      box.addAll(state.characters);
      box.put('length',state.characters.length);
      // print(state.characters.length);
    }else if (box.isNotEmpty &&
        (connectivityResults == ConnectivityResult.wifi ||
            connectivityResults == ConnectivityResult.mobile)){
      await box.clear();
      await initList();
      box.addAll(state.characters);
      box.put('length', state.characters.length);

    }else if (box.isNotEmpty && connectivityResults == ConnectivityResult.none){
      int counter = box.get('length');
      List<Character> tempCharacterList = [];
      for(int i = 0; i< counter;i++){
        Character characterInstance = box.getAt(i);
        tempCharacterList.add(characterInstance);
      }
      emit(state.copyWith(characters: tempCharacterList, index: 0));
    }


  }

  Future<void> initList() async {
    // const CircularProgressIndicator ();
    state.characters.clear();
    final json = await service.getCharacters();
    List<Character> characters = Character.fromJSON(json);
    emit(state.copyWith(characters: characters, index: 0));
  }

  void updateIndex(int i) {
    emit(state.copyWith(characters: state.characters, index: i));
    // print(state.index);
  }
/*
  void addCharacter(List<Character> characters){
    state.characters.addAll(characters);
  }*/

}