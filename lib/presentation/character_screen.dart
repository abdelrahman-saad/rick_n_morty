import 'package:flutter/material.dart';
import 'package:rick_n_morty/const.dart';
class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);
  static const String route = '/character';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                  'https://rickandmortyapi.com/api/character/avatar/2.jpeg'),
              const SizedBox(height: 15.0,),
              Text('Name:  Rick Sanches',style: textStyle),
              const SizedBox(height: 15.0,),
              Text('Status:  Alive',style: textStyle,),
              const SizedBox(height: 15.0,),
              Text('Gender:  Male',style: textStyle,),
              const SizedBox(height: 15.0,),
              Text('Location:  Citadel of ricks', style: textStyle,),
              const SizedBox(height: 15.0,),
              Text('Origin:  Unknown',style: textStyle),
            ],),
        )
    );
  }
}
