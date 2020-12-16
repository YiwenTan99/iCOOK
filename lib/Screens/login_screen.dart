import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Signup_screen.dart';
import 'package:iCOOK/Screens/Welcome_screen.dart';
import 'package:iCOOK/Screens/bottomnavi.dart';
import 'package:iCOOK/components/already_have_an_account_acheck.dart';
import 'package:iCOOK/components/rounded_button.dart';
import 'package:iCOOK/components/rounded_input_field.dart';
import 'package:iCOOK/components/rounded_password_field.dart';
import 'package:iCOOK/services/auth.dart';
import 'package:iCOOK/shared/constant.dart';
import 'package:iCOOK/shared/loading.dart';

class LoginScreen extends StatefulWidget {
  final Function toggleView;
  LoginScreen({this.toggleView});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                      return WelcomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            extendBodyBehindAppBar: true,
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.jpg"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         SizedBox(
                          height: 90,
                        ),
                        Image.asset(
                          'assets/images/logo.png',

                        ),
                        SizedBox(
                          height: 80,
                        ),
                        RoundedInputField(
                          validator: (_email) =>
                              _email.isEmpty ? 'Enter an email' : null,
                          hintText: "Email",
                          icon: Icons.mail,
                          onChanged: (_email) {
                            setState(() {
                              email = _email;
                            });
                          },
                        ),
                        error != ''
                            ? Text(
                                error,
                                style: TextStyle(color: Colors.redAccent),
                              )
                            : SizedBox(),
                        RoundedPasswordField(
                          validator: (_password) => _password.length < 6
                              ? 'Enter a password minimum 6 character'
                              : null,                      
                          onChanged: (_password) {
                            setState(() {
                              password = _password;
                            });
                          },
                        ),
                        SizedBox(
                          height: 0.1,
                        ),
                        // ignore: missing_required_param
                        RoundedButton(
                            text: "LOGIN",
                            textColor: Colors.redAccent,
                            color: kPrimaryLightColor,
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);

                                if (result == null) {
                                  setState(() {
                                    error =
                                        'could not sign in with those credentials';
                                    loading = false;
                                  });
                                } else {
                                  print(result);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return MyBottomNavigationBar();
                                      },
                                    ),
                                  );
                                }
                              }
                            }),
                        AlreadyHaveAnAccountCheck(
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
                        SizedBox(
                          height: 200,
                        )
                      ],
                    ),
                  ),
              ),
            ),
          );
  }
}
