import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
//Sign in or register with gmail
  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = (await _auth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: gSA.idToken, accessToken: gSA.accessToken)))
        .user;

    return user;
  }

//Register with email and password
  Future<FirebaseUser> signUp(String email, String password) async {
    print(email);
    print(password);
    AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim()); //Trim in order t valdiate in Freibase
    FirebaseUser user = result.user;
    return user;
  }

//sign in with email password
  Future signinWithEmailPassword(String email, String password) async {
    try {
      print(email);
      print(password);
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim()); //Trim in order t valdiate in Freibase
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  void signOut() async {
    await _auth.signOut().then((value) => print("Sesion cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }
}
