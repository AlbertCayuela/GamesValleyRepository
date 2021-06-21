import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';

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
    } on FirebaseAuthException {
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
          'cvurl': '',
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

  Future<bool> ForgotPassword(String email) async {
    try {
      await firebaseAuth
        ..sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  //sign out
  Future<void> singOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> deleteUser() async {
    await FirebaseFirestore.instance
        .collection('work')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('studies')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('languages')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await firebaseAuth.currentUser.delete();
  }

  Future<void> deleteCompany() async {
    List companyOffers = await getCompanyOffers();
    for (int i = 0; i < companyOffers.length; i++) {
      await FirebaseFirestore.instance
          .collection('applicants')
          .doc(companyOffers[i][12])
          .delete();
    }
    await FirebaseFirestore.instance
        .collection('offers')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid)
        .delete();
    await firebaseAuth.currentUser.delete();
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
  Future<UserInformation> getUserInfo(var userUid) async {
    UserInformation user = UserInformation();
    var workMaps;
    var studiesMaps;
    var languagesMaps;
    DocumentReference docReference =
        FirebaseFirestore.instance.collection('users').doc(userUid);
    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        user.username = datasnapshot.get('username');
        user.uid = docReference.id;
        user.email = datasnapshot.get('email');
        user.profileImageUrl = datasnapshot.get('profileimageurl');
        user.name = datasnapshot.get('name');
        user.surname = datasnapshot.get('surname');
        user.phone = datasnapshot.get('phone');
        user.cvUrl = datasnapshot.get('cvurl');
      } else {
        print('cant find this user...');
      }
    });

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('work').doc(userUid);
    await documentReference.get().then((datasnapshot) {
      workMaps = datasnapshot.data();
      List workExperiences = workMaps.values.toList();
      workExperiences.sort((a, b) => a[3].compareTo(b[3]));
      user.workExperiences = workExperiences.reversed.toList();
    });

    DocumentReference dReference =
        FirebaseFirestore.instance.collection('studies').doc(userUid);
    await dReference.get().then((datasnapshot) {
      studiesMaps = datasnapshot.data();
      List studies = studiesMaps.values.toList();
      studies.sort((a, b) => a[3].compareTo(b[3]));
      user.studies = studies.reversed.toList();
    });

    DocumentReference reference =
        FirebaseFirestore.instance.collection('languages').doc(userUid);
    await reference.get().then((datasnapshot) {
      languagesMaps = datasnapshot.data();
      user.languages = languagesMaps.values.toList();
      // print('languages:');
      // print(user.languages);
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

  Future getLanguages() async {
    var languagesMaps;
    List languages = [];
    DocumentReference reference = FirebaseFirestore.instance
        .collection('languages')
        .doc(firebaseAuth.currentUser.uid);
    await reference.get().then((datasnapshot) {
      languagesMaps = datasnapshot.data();
      languages = languagesMaps.values.toList();
      // print('languages:');
      // print(user.languages);
    });

    return languages;
  }

  Future getStudies() async {
    var studiesMaps;
    List studies = [];
    DocumentReference reference = FirebaseFirestore.instance
        .collection('studies')
        .doc(firebaseAuth.currentUser.uid);
    await reference.get().then((datasnapshot) {
      studiesMaps = datasnapshot.data();
      studies = studiesMaps.values.toList();
    });

    return studies;
  }

  Future getWorkExperiences() async {
    var workMaps;
    List workExperiences = [];
    DocumentReference reference = FirebaseFirestore.instance
        .collection('work')
        .doc(firebaseAuth.currentUser.uid);
    await reference.get().then((datasnapshot) {
      workMaps = datasnapshot.data();
      workExperiences = workMaps.values.toList();
    });

    return workExperiences;
  }

  //create a job offer being a company
  Future<void> createJobOffer(
      {@required String title,
      @required String country,
      @required String workField,
      String annualSalary,
      @required String type,
      @required String requirements,
      @required String workerDuties,
      String currency,
      String extraInformation}) async {
    String companyName;
    String companyDescription;
    String companyImageUrl;

    var uuid;

    DocumentReference docReference = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser.uid);

    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        companyName = datasnapshot.get('username');
        companyDescription = datasnapshot.get('description');
        companyImageUrl = datasnapshot.get('profileimageurl');
      }
    });
    var offerArray = [
      Timestamp.now().millisecondsSinceEpoch.toString(),
      companyName,
      companyDescription,
      companyImageUrl,
      title,
      country,
      workField,
      annualSalary,
      type,
      requirements,
      workerDuties,
      extraInformation,
      uuid = Uuid().v1().toString(),
      firebaseAuth.currentUser.uid,
      currency,
    ];

    db.collection('offers').doc(firebaseAuth.currentUser.uid).update({
      Timestamp.now().millisecondsSinceEpoch.toString(): offerArray,
    });

    db.collection('applicants').doc(uuid).set({});
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

  //get all the offers
  Future getAllOffers() async {
    CollectionReference colReference =
        FirebaseFirestore.instance.collection('offers');
    QuerySnapshot querySnapshot = await colReference.get();

    var dataMap = querySnapshot.docs.map((e) => e.data()).toList();
    var data = [];
    var finalData = [];

    for (int i = 0; i < dataMap.length; i++) {
      data.add(dataMap[i].values.toList());
    }

    for (int j = 0; j < data.length; j++) {
      for (int x = 0; x < data[j].length; x++) {
        finalData.add(data[j][x]);
      }
    }

    finalData.sort((a, b) => a[0].compareTo(b[0]));

    var dataSorted = finalData.reversed.toList();

    return dataSorted;
  }

  //select pdf and upload as CV
  Future pickCVAndUpload() async {
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = File(result.files.single.path);
      if (file != null) {
        String fileName = basename(file.path);
        print(fileName);
        var snapshot = await storage
            .ref()
            .child('CV/' + firebaseAuth.currentUser.uid)
            .putFile(file);

        String cvUrl = await snapshot.ref.getDownloadURL();
        db.collection('users').doc(firebaseAuth.currentUser.uid).update({
          'cvurl': cvUrl,
        });
        return fileName;
      }
    } else {
      return null;
    }
  }

  //select image and upload as profile image
  Future<String> pickImageAndUpload() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    List companyOffers;
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
        await getIsCompany().then((value) async {
          if (value == true) {
            await getCompanyOffers().then((value) {
              companyOffers = value;
            });
            DocumentReference docReference = FirebaseFirestore.instance
                .collection('offers')
                .doc(firebaseAuth.currentUser.uid);
            docReference.set({}).then((_) {
              for (int i = 0; i < companyOffers.length; i++) {
                companyOffers[i][3] = downloadUrl;
                docReference.update({i.toString(): companyOffers[i]});
              }
            });
          }
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

  Future<bool> applyToOffer(
      var offerUid, var userUid, bool applyWithProfile) async {
    bool applied;
    UserInformation user = UserInformation();
    print(offerUid.toString());
    print(userUid);
    print('im here!');

    await getUserInfo(userUid).then((value) {
      user = value;
    });

    if (user.name != '' && user.surname != '') {
      print('its true');
      var applicantArray = [];
      applicantArray = [
        userUid,
        applyWithProfile,
      ];
      db.collection('applicants').doc(offerUid).update({
        userUid: applicantArray,
      });
      if (applyWithProfile == false && user.cvUrl == '') {
        applied = false;
        return applied;
      }
      applied = true;
      return applied;
    } else {
      print('its false');
      applied = false;
      return applied;
    }
  }

  Future getOfferApplicants(var offerUid) async {
    var applicants = [];

    DocumentReference docReference =
        FirebaseFirestore.instance.collection('applicants').doc(offerUid);

    await docReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        applicants = datasnapshot.data().values.toList();
        print('APPLICANTS');
        print(applicants);
      }
    });

    return applicants;
  }

  //updates languages from profile
  Future updateLanguages(List languages, int deletePosition) async {
    languages.removeAt(deletePosition);
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('languages')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.set({}).then((_) {
      for (int i = 0; i < languages.length; i++) {
        docReference.update({i.toString(): languages[i]});
      }
    });
  }

  Future updateStudies(List studies, int deletePosition) async {
    studies.removeAt(deletePosition);
    DocumentReference docReference = FirebaseFirestore.instance
        .collection('studies')
        .doc(firebaseAuth.currentUser.uid);
    await docReference.set({}).then((_) {
      for (int i = 0; i < studies.length; i++) {
        docReference.update({i.toString(): studies[i]});
      }
    });
  }

  Future updateWorkExperiences(List workExperiences, int deletePosition) async {
    workExperiences.removeAt(deletePosition);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('work')
        .doc(firebaseAuth.currentUser.uid);
    await documentReference.set({}).then((_) {
      for (int i = 0; i < workExperiences.length; i++) {
        documentReference.update({i.toString(): workExperiences[i]});
      }
    });
  }

  Future deleteOffer(int deletePosition, var offerUid) async {
    List companyOffers = [];
    await getCompanyOffers().then((value) {
      companyOffers = value;
    });

    companyOffers.removeAt(deletePosition);

    DocumentReference documentReferece = FirebaseFirestore.instance
        .collection('offers')
        .doc(firebaseAuth.currentUser.uid);

    documentReferece.set({}).then((_) {
      for (int i = 0; i < companyOffers.length; i++) {
        documentReferece.update({i.toString(): companyOffers[i]});
      }
    });

    DocumentReference docRef =
        FirebaseFirestore.instance.collection('applicants').doc(offerUid);
    docRef.delete();
  }
}

class UserInformation {
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
  var cvUrl;
}

class CompanyInfo {
  String name;
  String email;
  String description;
  String profileImageUrl;
  List<dynamic> offers;
  var uid;
}
