import 'package:flutter/material.dart';
import 'package:square_mobil/src/GameDescription.dart';
import 'package:square_mobil/src/GameDisplay.dart';

class Catalog extends StatelessWidget {

  final List<GameDescription> gameList = [
      GameDescription("Taquin","https://play-lh.googleusercontent.com/Ecfnwr4gn39lt3tU1FrK2n4kI_IZ-rJmezE3_hI5gGeeDMnioDwghAT0F5Bk95tNtQ", "Taquin est marrant", "TAQUIN"),
      GameDescription("Puissance 4", "https://m.media-amazon.com/images/I/81ZNRHJ+cIL.jpg", "Puissance 4 est bieng", "CONNECT_FOUR"),
      GameDescription("Morpion", "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Tic_tac_toe.svg/1200px-Tic_tac_toe.svg.png", "Le morpion c'est facile", "TIC-TAC-TOE")
  ];

  Catalog({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: gameList.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 500,
          child: GameDisplay(gameList[index]),
        );
      }
    );
  }

}