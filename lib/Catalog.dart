import 'package:flutter/material.dart';
import 'package:square_mobil/GameDescription.dart';
import 'package:square_mobil/GameDisplay.dart';

class Catalog extends StatelessWidget {

  final List<GameDescription> gameList = [
      GameDescription("Taquin","https://play-lh.googleusercontent.com/Ecfnwr4gn39lt3tU1FrK2n4kI_IZ-rJmezE3_hI5gGeeDMnioDwghAT0F5Bk95tNtQ", "Taquin est marrant"),
      GameDescription("Puissance 4", "https://m.media-amazon.com/images/I/81ZNRHJ+cIL.jpg", "Puissance 4 est bieng"),
      GameDescription("Morpion", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Tic_tac_toe.svg/1200px-Tic_tac_toe.svg.png", "Le morpion c'est facile")
  ];

  Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: gameList.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: context.,
          child: GameDisplay(gameList[index]),
        );
      }
    );
  }

}