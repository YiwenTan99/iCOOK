import 'package:flutter/material.dart';

import 'package:iCOOK/Screens/recipes_screen.dart';
import 'package:iCOOK/Screens/scan_screen.dart';
import 'package:iCOOK/Screens/tips_screen.dart';
import 'package:iCOOK/Screens/update_screen.dart';

class BottomNavigationbBar extends StatelessWidget {
  const BottomNavigationbBar({
    Key key,
    @required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30,
      selectedFontSize: 15,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(Icons.linked_camera),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScanScreen();
                      },
                    ),
                  );
                }),
            // ignore: deprecated_member_use
            title: Text('Camera'),
            backgroundColor: Colors.lightGreen),
        BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(Icons.menu_book),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RecipesScreen();
                      },
                    ),
                  );
                }),
            // ignore: deprecated_member_use
            title: Text('Recipes'),
            backgroundColor: Colors.lightGreen),
        BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(Icons.rule),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TipsScreen();
                      },
                    ),
                  );
                }),
            // ignore: deprecated_member_use
            title: Text('Tips'),
            backgroundColor: Colors.lightGreen),
        BottomNavigationBarItem(
            icon: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UpdateScreen();
                      },
                    ),
                  );
                }),
            // ignore: deprecated_member_use
            title: Text('Profile'),
            backgroundColor: Colors.lightGreen),
      ],
    );
  }
}
