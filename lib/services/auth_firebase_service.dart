import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
        //Create Collection in firebasefirestore
        final userCollection = FirebaseFirestore.instance.collection('User');
        final currentUser = await _auth.currentUser!.uid;
        Map<String , dynamic> userMap =
        {
          'username':username,
          'email':email,
          'password':password,
          'uid': currentUser
        };
        userCollection.add(userMap);
        userCollection.doc(currentUser).set(userMap);
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
      if (User.user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e;
    }
  }

  //get current user /name/email
  Future<dynamic> currentUserData() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null){
      try{
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('User').doc(currentUser.uid).get();
        if(userDoc.exists){
          Map<String , dynamic> userMap = {
            'username':userDoc['username'],
            'email':userDoc['email']
          };
          return userMap;
        }else{
          return null;
        }
      }catch(e){
        return e;
      }
    }else{
      return null;
    }
  }

  //get signout from firebase
  Future<dynamic> getSignOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      return e;
    }
  }


}
