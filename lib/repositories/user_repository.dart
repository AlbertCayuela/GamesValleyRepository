import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth firebaseAuth;

  UserRepository(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<bool> signIn({String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed up';
    } catch (e) {
      return e.message;
    }
  }

  Future<void> singOut() async {
    await firebaseAuth.signOut();
  }

  String getUserEmail() {
    String email;
    if (firebaseAuth.currentUser == null) {
      return 'current user is null';
    }
    email = firebaseAuth.currentUser.email;
    return email;
  }
}
