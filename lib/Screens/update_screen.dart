import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  // ignore: unused_field
  int _currentIndex = 2;
  List<Gender> _genders = Gender.getGenders();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _currentGender;
  String select;
  DateTime selectedDate = DateTime.now();
  final _username = TextEditingController();
  bool ontapSelected = false;
  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_genders);
    _currentGender = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Gender>> buildDropdownMenuItems(List genders) {
    // ignore: deprecated_member_use
    List<DropdownMenuItem<Gender>> items = List();
    for (Gender gender in genders) {
      items.add(
        DropdownMenuItem(
          value: gender,
          child: Text(gender.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Gender selectedGender) {
    setState(() {
      _currentGender = selectedGender;
    });
    print(_currentGender.name);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('Users')
            .document(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DocumentSnapshot ds = snapshot.data;
            _username.text = snapshot.data['Username'];

            return WillPopScope(
              onWillPop: () async => false,
              child: Form(
                key: _formKey,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.lightGreen,
                    title: Text(
                      'iCOOK - Profile',
                      style: GoogleFonts.specialElite(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
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
                            height: 10,
                          ),

                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),

                          TextFormField(
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            controller: _username,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            focusNode: FocusNode(),
                            validator: (val) => val.isEmpty ? 'Username' : null,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            ds["Gender"],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          DropdownButton(
                            value: _currentGender,
                            items: _dropdownMenuItems,
                            onChanged: (val) =>
                                setState(() => _currentGender = val),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            onTap: () {
                              ontapSelected = true;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Birth of Date",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            ds["Birthday Date"].toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          RaisedButton(
                            onPressed: () => _selectDate(context),
                            child: Text('Select date'),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // ignore: missing_required_param
                          RoundedButton(
                              textColor: Colors.white,
                              color: Colors.red[200],
                              text: "EDIT",
                              press: () async {
                                if (_formKey.currentState.validate()) {
                                  dynamic result =
                                      await DatabaseService(uid: user.uid)
                                          .updateUserData(
                                    date: selectedDate.toString(),
                                    gender: _currentGender.name,
                                    username: _username.text,
                                  );

                                  if (result == null) {
                                    setState(() {
                                      error = 'please supply a valid email';
                                    });
                                  }
                                }
                              }),

                          // ignore: missing_required_param
                          OutButton(
                            text: "LOG OUT",
                            textColor: Colors.redAccent,
                            color: Colors.red[200],
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
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Colors.lightGreen,
            ), //Background color
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
