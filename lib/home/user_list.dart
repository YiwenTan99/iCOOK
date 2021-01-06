import 'package:flutter/material.dart';
import 'package:iCOOK/home/user_tile.dart';
import 'package:iCOOK/models/user_info.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserInfo>>(context) ?? [];

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return UserTile(userInfo: users[index]);
      },
    );
  }
}
