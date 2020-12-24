import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iCOOK/Screens/Welcome_screen.dart';

import 'package:iCOOK/components/outline_button.dart';
import 'package:iCOOK/components/rounded_button.dart';

import 'package:iCOOK/models/user.dart';
import 'package:iCOOK/services/database.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

String userName;
String gender;
String email;
String password;
DateTime date;
String error = '';

class Gender {
  int id;
  String name;

  Gender(this.id, this.name);

  static List<Gender> getGenders() {
    return <Gender>[
      Gender(1, 'Male'),
      Gender(2, 'Female'),
    ];
  }
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> gender = ['male', 'female'];
  int _currentIndex = 2;
  List<Gender> _genders = Gender.getGenders();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _selectedGender;
  String select;
  DateTime selectedDate = DateTime.now();
  final _username = TextEditingController();
  bool ontapSelected = false;
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_genders);
    _selectedGender = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Gender>> buildDropdownMenuItems(List genders) {
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender company in genders) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Gender selectedGender) {
    setState(() {
      _selectedGender = selectedGender;
      // _selectedGender = _selectedGender.name == 'male'
      //     ? _dropdownMenuItems[0].value
      //     : _dropdownMenuItems[1].value;
    });
    print(_selectedGender.name);
  }

  @override
  Widget build(BuildContext context) {
    /*return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: Provider.of(context).auth.getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text("${snapshot.data.displayUsername}");
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );*/
    /*final users = Provider.of<List<InfoUser>>(context);
    users.forEach((user) {
      print(user.username);
      print(user.email);
      print(user.gender);
      print(user.date);
    });
    return StreamProvider<List<InfoUser>>.value(
      value: DatabaseService().users,*/
    // yang ini sebelum ni
    final user = Provider.of<User>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            _username.text = snapshot.data.documents[5].data['Username'];
            if (ontapSelected == false) {
              _selectedGender = snapshot.data.documents[5]['Gender'] == 'male'
                  ? _dropdownMenuItems[0].value
                  : _dropdownMenuItems[1].value;
            }
            // print(snapshot.data.documents[5]['Gender']);
            // String username = snapshot.data.documents[5]['Username'];
            // print(_username.text = snapshot.data.documents[5]['Username']);
            //return Text('Loading data.. Please Wait..');
            //print(snapshot.data.documents[0]['Usename']);
            // return Column(
            //   children: <Widget>[
            //     Text(snapshot.data.documents[0]['Birthday Date'].toString()),
            //     Text(snapshot.data.documents[0]['Gender'].toString()),
            //     Text(snapshot.data.documents[0]['Usename']),
            //   ],
            // );

            return Form(
              key: _formKey,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.lightGreen,
                  title: Text('iCOOK - profile'),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                ),
                body: Container(
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 35,
                        ),

                        // BuildTextField(
                        //   controller: _username,
                        //   validator: (_name) =>
                        //       _name.isEmpty ? 'Enter a name' : null,
                        //   hintText: "Username",
                        //   icon: Icons.person,
                        //   onChanged: (_name) {
                        //     setState(() {
                        //       _username.text = _name;
                        //     });
                        //   },
                        // ),
                        TextFormField(
                          controller: _username,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.text,
                          focusNode: FocusNode(),
                          validator: (username) {
                            if (username == '') {
                              return 'username invalid';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 30),
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            filled: false,
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        //pass value
                        /*RoundedInputField(
                          validator: (_email) => _email.isEmpty
                              ? 'Enter an email'
                              : !_email.contains("@")
                                  ? "enter a valid email"
                                  : null,
                          hintText: "Email",
                          icon: Icons.mail,
                          onChanged: (_email) {
                            setState(() {
                              email = _email;
                            });
                          },
                        ),
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
                        ),*/
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownButton(
                          value: _selectedGender,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem,
                          onTap: () {
                            ontapSelected = true;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Birthday",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // selectedDate != null
                        //     ? Text("${selectedDate.toLocal()}".split(' ')[0])
                        //     :
                        Text(snapshot.data.documents[5]['Birthday Date']
                            .toString()),
                        SizedBox(
                          height: 5.0,
                        ),
                        RaisedButton(
                          onPressed: () => _currentDate(context),
                          child: Text('Select date'),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // ignore: missing_required_param
                        RoundedButton(
                            textColor: Colors.white,
                            color: Colors.red[200],
                            text: "Edit",
                            press: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await DatabaseService(uid: user.uid)
                                        .updateUserData(
                                            usernameToDb: _username.text,
                                            dateToDb: selectedDate.toString(),
                                            genderToDb: _selectedGender.name);
                                if (result == null) {
                                  setState(() {
                                    error = 'please supply a valid email';
                                  });
                                }
                              }
                            }),
                        /*print(_currentUserName);
                            print(_currentEmail);
                            print(_currentGender);
                            print(_currentDate);
                          },*/

                        // ignore: missing_required_param
                        OutButton(
                          text: "LOG OUT",
                          textColor: Colors.redAccent,
                          color: Colors.pink[50],
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                /*bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  iconSize: 30,
                  selectedFontSize: 15,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.linked_camera),
                        // ignore: deprecated_member_use
                        title: Text('Camera'),
                        backgroundColor: Colors.lightGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu_book),
                        // ignore: deprecated_member_use
                        title: Text('Recipes'),
                        backgroundColor: Colors.lightGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.rule),
                        // ignore: deprecated_member_use
                        title: Text('Tips'),
                        backgroundColor: Colors.lightGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        // ignore: deprecated_member_use
                        title: Text('Profile'),
                        backgroundColor: Colors.lightGreen),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),*/
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  /*Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 24,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }*/

  Future<void> _currentDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
