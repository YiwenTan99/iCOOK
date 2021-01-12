import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Welcome_screen.dart';
import 'package:iCOOK/Screens/login_screen.dart';
import 'package:iCOOK/components/already_have_an_account_acheck.dart';
import 'package:iCOOK/components/rounded_button.dart';
import 'package:iCOOK/components/rounded_input_field.dart';
import 'package:iCOOK/components/rounded_password_field.dart';
import 'package:iCOOK/services/auth.dart';
import 'package:iCOOK/shared/constant.dart';
import 'package:iCOOK/shared/loading.dart';

class SignupScreen extends StatefulWidget {
  final Function toggleView;
  SignupScreen({this.toggleView});
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String name;

  String email;
  String password;
  DateTime date;
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
                  Navigator.of(context).pop();
                },
              ),
            ),
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Container(
                //  height: MediaQuery.of(context).size.height,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.jpg"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 120,
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        // height: 250.0,
                      ),
                      SizedBox(
                        height: 60,
                      ),

                      RoundedInputField(
                        validator: (_name) =>
                            _name.isEmpty ? 'Enter a name' : null,
                        hintText: "Username",
                        icon: Icons.person,
                        onChanged: (_name) {
                          setState(() {
                            name = _name;
                          });
                        },
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
                        hintText: "Password",
                        icon: Icons.mail,
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
                        text: "SIGN UP",
                        press: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, name);
                            print("here is data");
                            print(result);
                            if (result == null) {
                              setState(() {
                                error = 'please supply a valid email';
                                loading = false;
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return WelcomeScreen();
                                  },
                                ),
                              );
                            }
                          }
                        },
                        textColor: Colors.redAccent,
                        color: kPrimaryLightColor,
                        size: null,
                      ),
                      AlreadyHaveAnAccountCheck(
                        login: false,
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
                      SizedBox(
                        height: 400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
