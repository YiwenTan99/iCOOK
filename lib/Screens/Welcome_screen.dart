import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iCOOK/Screens/Signup_screen.dart';
import 'package:iCOOK/Screens/login_screen.dart';
import 'package:iCOOK/components/rounded_button.dart';
import 'package:iCOOK/shared/constant.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500)
    );
    Timer(Duration(milliseconds: 200),()=> _animationController.forward());
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1,0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                  child: Text(
                    'Bon Appetit',
                    style: GoogleFonts.lobster(
                      fontSize: 30,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              'assets/images/mainLogo.png',
              width: 200,
            ),
             
             SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1,0),
                end: Offset.zero,
              ).animate(_animationController),
              child: FadeTransition(
                opacity: _animationController,
                child: Container(
                  child: Text(
                    'Cook With Love',
                    style: GoogleFonts.lobster(
                      
                      fontSize: 30,
                      color: Colors.red[300],
                    ),
                  ),
                ),
            ),
             ),
             SizedBox(height: 80.0),
            // ignore: missing_required_param
            RoundedButton(
              text: "SIGN UP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignupScreen();
                    },
                  ),
                );
              },
            ),
            // ignore: missing_required_param
            RoundedButton(
              text: "LOGIN",
              textColor: Colors.redAccent,
              color: kPrimaryLightColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
