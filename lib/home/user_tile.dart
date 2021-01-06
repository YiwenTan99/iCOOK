import 'package:flutter/material.dart';
import 'package:iCOOK/models/user_info.dart';

class UserTile extends StatelessWidget {
  final UserInfo userInfo;
  UserTile({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(userInfo.username),
          subtitle: Text(userInfo.gender),
        ),
      ),
    );
  }
}
