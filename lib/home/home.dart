import 'package:flutter/material.dart';
import 'package:iCOOK/home/settings_form.dart';
import 'package:iCOOK/home/user_list.dart';
import 'package:iCOOK/models/user_info.dart';
import 'package:iCOOK/services/auth.dart';
import 'package:iCOOK/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<UserInfo>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('iCOOK'),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('update'),
              onPressed: () => _showSettingPanel(),
            )
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
