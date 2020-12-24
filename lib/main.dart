import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Welcome_screen.dart';
import 'package:iCOOK/models/user.dart';
import 'package:iCOOK/services/auth.dart';
import 'package:iCOOK/shared/constant.dart';
import 'package:provider/provider.dart';
//..

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iCOOK',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
