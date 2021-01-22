import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository with ChangeNotifier {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;

  Future<void> addUserToFirebase(
      String username, String password, String email, bool isLogin) async {
    if (!isLogin) {
      await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
    }
  }
}
