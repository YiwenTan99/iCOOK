import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

// database reference
  final CollectionReference icookCollection =
      Firestore.instance.collection('Users');

  Future updateUserData(String name) async {
    return await icookCollection.document(uid).setData({
      'name': name,
    });
  }
}
