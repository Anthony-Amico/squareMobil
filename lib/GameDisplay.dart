import 'package:flutter/material.dart';
import 'package:square_mobil/GameDescription.dart';

class GameDisplay extends StatelessWidget {
  final GameDescription game;

  const GameDisplay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(child: Align( alignment: Alignment.center,child: Text(game.title,),)),
      Expanded(child: Image(
        image: NetworkImage(game.imageUrl),
      )),
      Expanded(child: Align(alignment: Alignment.center, child: Text(game.description)))
    ]));
  }
}
