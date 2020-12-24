import 'package:firebase_auth/firebase_auth.dart';

import 'package:iCOOK/Screens/Welcome_screen.dart';
import 'package:iCOOK/Screens/update_screen.dart';

import 'package:iCOOK/models/user.dart';
import 'package:iCOOK/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // get uid
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

  // get current user
  Future getCurrentUser() async {
    return await _auth.currentUser();
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user != null) {
        UserUpdateInfo updateuser = UserUpdateInfo();
        updateuser.displayName = name;
        user.updateProfile(updateuser);
      }

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(
        //emailToDb: email,
        //passwordToDb: password,
        usernameToDb: name,
        genderToDb: gender.toString(),
        dateToDb: date.toString(),
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return WelcomeScreen();
    }
  }

  //Future updateUserInfo(String genderToDb, String nameToDb, String email,
  //DateTime dateToDb) async {
  //CollectionReference collectionReference =
  // Firestore.instance.collection('user');
  // QuerySnapshot querySnapshot = await collectionReference.getDocuments();
  //querySnapshot.documents[0].reference.updateData({
  /* genderToDb: genderToDb,
      nameToDb: nameToDb,
      email: email,
      dateToDb.toString(): dateToDb.toString(),
    }); */
  /*final firestoreInstance = Firestore.instance;
  void updateUserInfo() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser() <User>();
    firestoreInstance.collection("Users").document(firebaseUser.uid);
  }*/

// update with name, email, date, gender

}
