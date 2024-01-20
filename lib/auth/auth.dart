import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Authentication {
  Future<bool> login(String email, String password) async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future resetPassword(String email) async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future logOut() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
