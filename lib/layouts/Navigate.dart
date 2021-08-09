import 'package:flutter/material.dart';
import 'package:tvmazeflutter/constants/Config.dart';

class Navigate extends StatelessWidget {
  final onTap;
  final currentIndex;

  Navigate({this.onTap, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.video_call), label: "Shows"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourite"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setings"),
      ],
      unselectedFontSize: 10,
      selectedFontSize: 10,
      selectedItemColor: Config.COLORPRIMARY,
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }
}
