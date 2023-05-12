import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      iconSize: 36,
      selectedFontSize: 10,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.castle_outlined), label: 'Mes parties en cours'),
        BottomNavigationBarItem(icon: Icon(Icons.podcasts_outlined), label: 'Catalogue de jeu'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mon compte')
      ],
    );
  }
}

