import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Welcome_screen.dart';
import 'package:iCOOK/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text('iCOOK'),
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );

              await _auth.signOut();
            },
          )
        ],
      ),
      body: Container(
        child: Placeholder(),
      ),
    );
  }
}
