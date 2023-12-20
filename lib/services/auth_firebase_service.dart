import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService {
  final String username;
  final String email;
  final String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthFirebaseService(
      {required this.username, required this.email, required this.password});

  //get Signup to firebaseAuth
  Future<dynamic> signupUser() async {
    try {
      final User = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (User != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e;
    }
  }

  //get Signin to firebaseAuth
  Future<dynamic> siginUser() async {
    try {
      final User = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (User != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e;
    }
  }

  //get signout from firebase
  Future<dynamic> getSignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      return e;
    }
  }
}
