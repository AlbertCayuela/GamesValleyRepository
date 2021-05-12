import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File imageFile;

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
  Future<bool> signUp(
      {String email, String password, String userName, bool isCompany}) async {
    bool success;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      success = true;
    } catch (e) {
      return false;
    }

    if (success) {
      if (!isCompany) {
        db.collection('users').doc(firebaseAuth.currentUser.uid).set({
          'username': userName,
          'email': firebaseAuth.currentUser.email,
          'registrationdate': DateTime.now(),
          'iscompany': isCompany,
          'profileimageurl': '',
          'name': '',
          'surname': '',
          'phone': '',
        });
        db.collection('work').doc(firebaseAuth.currentUser.uid).set({});
        db.collection('studies').doc(firebaseAuth.currentUser.uid).set({});
        db.collection('languages').doc(firebaseAuth.currentUser.uid).set({});
      } else if (isCompany) {
        db.collection('users').doc(firebaseAuth.currentUser.uid).set({
          'username': userName,
          'email': firebaseAuth.currentUser.email,
          'registrationdate': DateTime.now(),
          'iscompany': isCompany,
          'profileimageurl': '',
          'description': '',
        });
        db.collection('offers').doc(firebaseAuth.currentUser.uid).set({});
      }
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

  //get if user is a company
  Future<bool> getIsCompany() async {
    bool isCompany;
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid);

    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        isCompany = datasnapshot.get('iscompany');
      }
    });

    return isCompany;
  }

  //get company information into company class
  Future<CompanyInfo> getCompanyInfo() async {
    CompanyInfo company = CompanyInfo();
    var offersMaps;
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        company.name = datasnapshot.get('username');
        company.uid = docReference.id;
        company.email = datasnapshot.get('email');
        company.description = datasnapshot.get('description');
        company.profileImageUrl = datasnapshot.get('profileimageurl');
      }
    });

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('offers')
        .doc(firebaseAuth.currentUser.uid);
    await docRef.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        offersMaps = datasnapshot.data();
        company.offers = offersMaps.values.toList();
      }
    });

    return company;
  }

  //get user information into user class
  Future<UserInfo> getUserInfo() async {
    UserInfo user = UserInfo();
    var workMaps;
    var studiesMaps;
    var languagesMaps;
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        user.username = datasnapshot.get('username');
        user.uid = docReference.id;
        user.email = datasnapshot.get('email');
        user.profileImageUrl = datasnapshot.get('profileimageurl');
        user.name = datasnapshot.get('name');
        user.surname = datasnapshot.get('surname');
        user.phone = datasnapshot.get('phone');
      } else {
        print('cant find this user...');
      }
    });

    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('work')
        .doc(firebaseAuth.currentUser.uid);
    await documentReference.get().then((datasnapshot) {
      workMaps = datasnapshot.data();
      user.workExperiences = workMaps.values.toList();
      print('work:');
      print(user.workExperiences);
    });

    DocumentReference dReference = FirebaseFirestore.instance
        .collection('studies')
        .doc(firebaseAuth.currentUser.uid);
    await dReference.get().then((datasnapshot) {
      studiesMaps = datasnapshot.data();
      user.studies = studiesMaps.values.toList();
      print('studies:');
      print(user.studies);
    });

    DocumentReference reference = FirebaseFirestore.instance
        .collection('languages')
        .doc(firebaseAuth.currentUser.uid);
    await reference.get().then((datasnapshot) {
      languagesMaps = datasnapshot.data();
      user.languages = languagesMaps.values.toList();
      print('languages:');
      print(user.languages);
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
      Timestamp.now().millisecondsSinceEpoch.toString(): jobArray,
    });
  }

  void addStudies({
    @required String typeOfStudies,
    @required String centerOfStudies,
    @required String startingMonth,
    @required String startingYear,
    String finishingMonth,
    String finishingYear,
  }) {
    var studiesArray = [
      typeOfStudies,
      centerOfStudies,
      startingMonth,
      startingYear,
      finishingMonth,
      finishingYear
    ];

    db.collection('studies').doc(firebaseAuth.currentUser.uid).update({
      Timestamp.now().millisecondsSinceEpoch.toString(): studiesArray,
    });
  }

  void addLanguages({
    @required String language,
    @required String level,
  }) {
    var languageArray = [
      language,
      level,
    ];

    db.collection('languages').doc(firebaseAuth.currentUser.uid).update({
      Timestamp.now().millisecondsSinceEpoch.toString(): languageArray,
    });
  }

  //create a job offer being a company
  void createJobOffer(
      {@required String title,
      @required String country,
      @required String workField,
      String annualSalary,
      @required String type,
      @required String requirements,
      @required String workerDuties,
      String extraInformation}) {
    var offerArray = [
      title,
      country,
      workField,
      annualSalary,
      type,
      requirements,
      workerDuties,
      extraInformation
    ];

    db.collection('offers').doc(firebaseAuth.currentUser.uid).update({
      Timestamp.now().millisecondsSinceEpoch.toString(): offerArray,
    });
  }

  //get single company offers
  Future getCompanyOffers() async {
    var offers;
    var offersMaps;
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('offers')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        offersMaps = datasnapshot.data();
        offers = offersMaps.values.toList();
      }
    });

    return offers;
  }

  Future<String> pickImageAndUpload() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      print('SELECTED IMAGE: ' + basename(pickedImage.path));
      if (imageFile != null) {
        String fileName = basename(imageFile.path);
        print(fileName);
        var snapshot = await storage
            .ref()
            .child(firebaseAuth.currentUser.uid)
            .putFile(imageFile);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        db.collection('users').doc(firebaseAuth.currentUser.uid).update({
          'profileimageurl': downloadUrl,
        });
        return downloadUrl;
      }
    } else {
      return null;
    }
  }

  void changeName(String name) {
    db.collection('users').doc(firebaseAuth.currentUser.uid).update({
      'name': name,
    });
  }

  void changeSurname(String surname) {
    db.collection('users').doc(firebaseAuth.currentUser.uid).update({
      'surname': surname,
    });
  }

  void changePhone(String phone) {
    db.collection('users').doc(firebaseAuth.currentUser.uid).update({
      'phone': phone,
    });
  }

  void changeUsername(String username) {
    db.collection('users').doc(firebaseAuth.currentUser.uid).update({
      'username': username,
    });
  }

  void changeCompanyDescription(String description) {
    db.collection('users').doc(firebaseAuth.currentUser.uid).update({
      'description': description,
    });
  }
}

class UserInfo {
  String username;
  String email;
  String profileImageUrl;
  String name;
  String surname;
  String phone;
  var uid;
  List<dynamic> workExperiences;
  List<dynamic> studies;
  List<dynamic> languages;
}

class CompanyInfo {
  String name;
  String email;
  String description;
  String profileImageUrl;
  List<dynamic> offers;
  var uid;
}
