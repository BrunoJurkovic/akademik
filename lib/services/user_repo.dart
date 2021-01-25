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

  Future<void> logOutUser() {
    return _authInstance.signOut();
  }

  Future<UserCredential> signInToFirebase(String email, String password) async {
    try {
      UserCredential userCredential;
      userCredential = await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
