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
      // _selectedGender = _selectedGender.name == 'male'
      //     ? _dropdownMenuItems[0].value
      //     : _dropdownMenuItems[1].value;
    });
    print(_currentGender.name);
  }

  String _currentUsername;
  String _currentDate;
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

    /*return StreamBuilder<InfoUser>(
        stream: DatabaseService(uid: user.uid).infoUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            InfoUser infoUser = snapshot.data;*/

    /*return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _username.text = snapshot.data.documents[0].data['Username'];
            if (ontapSelected == false) {
              _selectedGender = snapshot.data.documents[0]['Gender'] == 'male'
                  ? _dropdownMenuItems[0].value
                  : _dropdownMenuItems[1].value;
            }*/
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

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
                            "Name",
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
                            //initialValue: userData.username,
                            controller: _username,
                            textCapitalization: TextCapitalization.none,
                            keyboardType: TextInputType.text,
                            focusNode: FocusNode(),
                            validator: (val) => val.isEmpty ? 'Username' : null,
                            onChanged: (val) =>
                                setState(() => _currentUsername = val),
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              filled: false,
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
                          DropdownButton(
                            value: _currentGender ?? userData.gender,
                            items: _dropdownMenuItems,
                            onChanged: (val) =>
                                setState(() => _currentGender = val),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
                                  await DatabaseService(uid: user.uid)
                                      .updateUserData(
                                    gender: _currentGender.toString() ??
                                        userData.gender,
                                    username:
                                        _currentUsername ?? userData.username,
                                    date: _currentDate.toString() ??
                                        userData.date,
                                  );

                                  Navigator.pop(context);
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
