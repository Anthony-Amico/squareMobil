import 'package:flutter/material.dart';
import 'package:square_mobil/src/GameDescription.dart';
import 'package:square_mobil/main.dart';

class GameDisplay extends StatelessWidget {
  final GameDescription game;

  const GameDisplay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
          child: Align(
              alignment: Alignment.center,
              child: Text(game.title,
                  style: const TextStyle(color: Colors.deepOrange)))),
      Expanded(child: Image(image: NetworkImage(game.imageUrl))),
      Expanded(
          child: Align(
              alignment: Alignment.center, child: Text(game.description))),
      OutlinedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'title'))); //TODO : redirect to right path
        },
        child: const Text('Jouer'),
      )
    ]));
  }
}
