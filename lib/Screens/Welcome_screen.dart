import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Signup_screen.dart';
import 'package:iCOOK/Screens/login_screen.dart';
import 'package:iCOOK/components/outline_button.dart';
import 'package:iCOOK/components/rounded_button.dart';
import 'package:iCOOK/shared/constant.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 300.0),
              // ignore: missing_required_param
              OutButton(
                text: "SIGN UP",
                color: Colors.white,
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
      ),
    );
  }
}
