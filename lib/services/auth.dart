import 'package:firebase_auth/firebase_auth.dart';
import 'package:playground/models/user.dart';

class AuthService {

  //create instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on user
  User _userFromFirebase(FirebaseUser user) {
    return user != null
        ? User(uid: user.uid)
        : null;
  }

  //sign in with email and password
  Future signInEmailPass(String user_email, String user_password) async {
    try {
      //Make a request
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: user_email,
          password: user_password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in anon
  Future signInAnon() async {
    try {
      //Make a request
      AuthResult result = await _auth.signInAnonymously();
      //gain access to user
      FirebaseUser user = result.user;
      return user;
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  //create user with email and password
  Future createUserEmailPass(String user_email, String user_password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: user_email,
          password: user_password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }
}