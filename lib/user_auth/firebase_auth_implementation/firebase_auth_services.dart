import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panchikawatta/global/common/toast.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    }  on FirebaseAuthException catch (e){

      if(e.code == 'email-already-in-use') {
        showToast(message:'The email addreess is already in use');
      }
    else{
      showToast(message:'An error occurred: ${e.code}');
    }
    
    }
    return null;
  
}
Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    }  on FirebaseAuthException catch(e){
        if(e.code == 'user-not-found'|| e.code == 'wrong-password') {
        showToast(message:'Invalid email or password');
      }
    
    }
    return null;
  
}
    Future<bool> sendEmailVerification(User user, BuildContext context) async {
    try {
      await user.sendEmailVerification();
      return true;
    } catch (e) {
      print("Failed to send verification email: $e");
      return false;
    }

  }
//  Future<String?> getIdToken(User user) async {
//   try {
//     String? token = await user.getIdToken();
//     print("Simulating sending token to backend: $token");
//     return token;
//   } catch (e) {
//     print("Error getting ID token: $e");
//     return null;
//   }
// }
Future<String?> getIdToken(User user) async {
  try {
    String? token = await user.getIdToken();
    print("ID Token retrieved successfully: $token"); // Add this line for debugging
    return token;
  } catch (e) {
    print("Error getting ID token: $e");
    return null;
  }
}

}
 