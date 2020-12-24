import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iCOOK/models/info_user.dart';
//import 'package:iCOOK/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

// database reference
  final CollectionReference usersCollection =
      Firestore.instance.collection('Users');

  Future updateUserData(
      { //String emailToDb,
      //String passwordToDb,
      String genderToDb,
      String usernameToDb,
      String dateToDb}) async {
    return await usersCollection.document(uid).setData({
      //'Email': emailToDb,
      //'Password': passwordToDb,
      'Gender': genderToDb,
      'Username': usernameToDb,
      'Birthday Date': dateToDb,
    });
  }

  // user data from snapshot
  /*UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      usernameToDb: snapshot.data['username'],
      //emailToDb: snapshot.data['email'],
      genderToDb: snapshot.data['gender'],
      dateToDb: snapshot.data['date'],
    );
  }*/

  // user list from snapshot
  List<InfoUser> _userListFormSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return InfoUser(
        username: doc.data['username'] ?? '',
        email: doc.data['email'] ?? '',
        gender: doc.data['gender'] ?? '',
        date: doc.data['date'] ?? '',
      );
    }).toList();
  }

  // get user strem
  Stream<List<InfoUser>> get users {
    return usersCollection.snapshots().map(_userListFormSnapshot);
  }

  // get user doc stream
  Stream<QuerySnapshot> get userData {
    return usersCollection.snapshots();
  }
}
