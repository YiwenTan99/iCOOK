import 'package:flutter/material.dart';
import 'package:iCOOK/components/rounded_button.dart';
import 'package:iCOOK/models/user.dart';
import 'package:iCOOK/models/user_info.dart';
import 'package:iCOOK/services/database.dart';
import 'package:iCOOK/shared/constant.dart';
import 'package:iCOOK/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

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

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> gender = ['male', 'female'];
  int _currentIndex = 2;
  List<Gender> _genders = Gender.getGenders();
  List<DropdownMenuItem<Gender>> _dropdownMenuItems;
  Gender _currentGender;
  String select;
  DateTime selectedDate = DateTime.now();
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
      //_selectedGender = _selectedGender.name == 'male'
      //? _dropdownMenuItems[0].value
      //: _dropdownMenuItems[1].value;
    });
    print(_currentGender.name);
  }

  // form values
  String _currentUsername;
  String _currentDate;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your profile.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.username,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'Username' : null,
                    onChanged: (val) => setState(() => _currentUsername = val),
                  ),
                  SizedBox(height: 20.0),
                  // dropdown
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
                    onChanged: (val) => setState(() => _currentGender = val),
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
                  // slider
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                            gender:
                                _currentGender.toString() ?? userData.gender,
                            username: _currentUsername ?? userData.username,
                            date: _currentDate ?? userData.date,
                          );

                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
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
