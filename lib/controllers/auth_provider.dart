import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signupWithEmailAndPassword(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email.toLowerCase().trim(), password: password.trim());
    notifyListeners();
  }

  Future<void> loginWithEmailAndPAssword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
        email: email.toLowerCase().trim(), password: password.trim());
    notifyListeners();
  }
}
