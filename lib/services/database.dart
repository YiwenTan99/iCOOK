import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iCOOK/models/user.dart';
import 'package:iCOOK/models/user_info.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

// database reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('Users');

  Future updateUserData({
    String gender,
    String username,
    String date,
  }) async {
    return await usersCollection.document(uid).setData({
      //'Email': emailToDb,
      //'Password': passwordToDb,
      'Gender': gender,
      'Username': username,
      'Birthday Date': date,
    });
  }

  // user list from snapshot
  List<UserInfo> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return UserInfo(
        username: doc.data['Username'] ?? '',
        gender: doc.data['Gender'] ?? '',
        date: doc.data['Birthday Date'] ?? '',
      );
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot.data['Username'],
      gender: snapshot.data['Gender'],
      date: snapshot.data['Birthday Date'],
    );
  }

  // get user strem
  Stream<List<UserInfo>> get users {
    return usersCollection.snapshots().map(_userListFromSnapshot);
  }

  // get User doc stream
  Stream<UserData> get userData {
    return usersCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
