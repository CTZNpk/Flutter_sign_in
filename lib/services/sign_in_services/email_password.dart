import 'package:sign_in/services/sign_in_services/abstract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordSignIn extends AbstractSignIn {
  String email, password;
  EmailAndPasswordSignIn(
      {super.setErrorOnScreen, required this.email, required this.password});

  @override
  Future checkAndReturnError(Function function) async {
    try {
      await function();
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        setErrorOnScreen!('No user found for that email');
      } else if (e.code == 'wrong-password') {
        setErrorOnScreen!('Wrong password provided for that user');
      } else if (e.code == 'invalid-email') {
        setErrorOnScreen!('Enter a Valid Email');
      }
      debugPrint(e.code);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future signingIn() async {
    await checkAndReturnError(_signInWithEmailAndPassword);
  }

  Future _signInWithEmailAndPassword() async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
