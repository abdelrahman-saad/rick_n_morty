import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rick_n_morty/business_logic/models/character.dart';
import 'package:meta/meta.dart';
import 'package:rick_n_morty/business_logic/services/graphql.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState>{
  CharacterCubit() : super(CharacterState([],0));
  GraphQLService service = GraphQLService();
  void fetchData()async{
    const CircularProgressIndicator();
    state.characters.clear();
    final json = await service.getCharacters() ;

    List<Character> characters = Character.fromJSON(json);
    emit(state.copyWith(characters: characters,index: 0));
    print(state.characters.length);
  }
  void updateIndex(int i ){
    emit(state.copyWith(characters: state.characters, index: i));
    print(state.index);
  }
  /*
  void addCharacter(List<Character> characters){
    state.characters.addAll(characters);
  }*/

}