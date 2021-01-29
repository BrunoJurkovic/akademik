import 'package:akademik/providers/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository with ChangeNotifier {
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final CollectionReference _firestoreInstance =
      FirebaseFirestore.instance.collection('users');
  AkademikUser _currentUser;

  AkademikUser get currentUser {
    return _currentUser ??
        AkademikUser(
            name: '', email: '', pictureUrl: '', username: '', year: 0);
  }

  Future<void> getCurrentUser() async {
    QuerySnapshot query;
    query = await _firestoreInstance
        .where('email', isEqualTo: _authInstance.currentUser.email)
        .get();
    _currentUser = AkademikUser.fromDocument(query.docs[0]);
    notifyListeners();
  }

  bool get isUserLoggedIn {
    print(_authInstance.currentUser.toString());
    return !(_authInstance.currentUser != null);
  }

  Future<void> logOutUser() {
    notifyListeners();
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
