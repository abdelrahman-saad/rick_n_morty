import 'package:rick_n_morty/business_logic/models/character.dart';

part of 'character_cubit.dart';

class CharacterState extends Equatable{
  List<Character> characters;
  int index = 0;
  CharacterState(this.characters,this.index);

  CharacterState copyWith({
    required List<Character> characters,
    required int index
  }) {
    return CharacterState(
       characters ,
        index
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    characters,index
  ];


}