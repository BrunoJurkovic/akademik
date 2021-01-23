import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository with ChangeNotifier {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final CollectionReference _firestoreInstance =
      FirebaseFirestore.instance.collection('users');

  bool get isUserLoggedIn {
    print(_authInstance.currentUser.toString());
    return !(_authInstance.currentUser != null);
  }

  Future<void> addUserToFirebase(
      String username, String password, String email, bool isLogin) async {
    if (!isLogin) {
      final userCredential = await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestoreInstance.doc(userCredential.user.uid).set(
        {
          'username': username,
          'email': email,
        },
      );
    } else {
      await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
    }
  }
}
