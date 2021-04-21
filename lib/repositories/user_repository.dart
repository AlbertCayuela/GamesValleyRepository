import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  UserRepository(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  //sign in
  Future<bool> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  //sign up
  Future<bool> signUp({String email, String password, String userName}) async {
    bool success;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      success = true;
    } catch (e) {
      return false;
    }

    if (success) {
      db.collection('users').doc(firebaseAuth.currentUser.uid).set({
        'username': userName,
        'email': firebaseAuth.currentUser.email,
        'registrationdate': DateTime.now(),
      });
      db.collection('work').doc(firebaseAuth.currentUser.uid).set({
        '0': [],
      });
      return true;
    }
  }

  //sign out
  Future<void> singOut() async {
    await firebaseAuth.signOut();
  }

  //get user email
  String getUserEmail() {
    String email;
    if (firebaseAuth.currentUser == null) {
      return 'current user is null';
    }
    email = firebaseAuth.currentUser.email;
    return email;
  }

  //get user information into user class
  Future<UserInfo> getUserInfo() async {
    UserInfo user = UserInfo();
    var maps;
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        user.username = datasnapshot.get('username');
        user.uid = docReference.id;
        user.email = datasnapshot.get('email');
      } else {
        print('cant find this user...');
      }
    });

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('work')
        .doc(firebaseAuth.currentUser.uid);
    await documentReference.get().then((datasnapshot) {
      maps = datasnapshot.data();
      user.workExperiences = maps.values.toList();
      print(user.workExperiences);
    });

    return user;
  }

  //upload new job experience
  void addJobExperience({
    @required String job,
    @required String company,
    @required String startingMonth,
    @required String startingYear,
    String finishingMonth,
    String finishYear,
  }) {
    var jobArray = [
      job,
      company,
      startingMonth,
      startingYear,
      finishingMonth,
      finishYear
    ];

    db.collection('work').doc(firebaseAuth.currentUser.uid).update({
      Timestamp.now().microsecondsSinceEpoch.toString(): jobArray,
    });
  }
}

class UserInfo {
  String username;
  String email;
  var uid;
  List<dynamic> workExperiences;
}
