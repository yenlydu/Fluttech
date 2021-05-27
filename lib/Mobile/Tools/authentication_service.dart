import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({BuildContext context, String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      showSimpleNotification(
          Text(
            "Welcome " + email + " !",
            textAlign: TextAlign.center,
          ),
          background: Colors.green);
      Navigator.pushNamed(context, "/my");

    return "Signed in";
    } on FirebaseAuthException catch (e) {
      print(["Error can't sign in : ", e]);
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      showSimpleNotification(
          Text(
            "User successfully created !",
            textAlign: TextAlign.center,
          ),
          background: Colors.green);

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(["Error can't sign up : ", e]);
      return e.message;
    }
  }

  Future<String> signInWithMicrosoft() async {
    try {
      User user = await FirebaseAuthOAuth().openSignInFlow("microsoft.com",
          ["email openid"], {'tenant': '901cb4ca-b862-4029-9306-e5cd0f6d9f86'});
      return "signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<User> getUserInfo() async {
    var firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser;
  }
}
