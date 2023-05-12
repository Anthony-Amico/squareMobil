import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  setCurrentIndex(int index){
  setState(() {
  _currentIndex = index;
  });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setCurrentIndex(index),
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


