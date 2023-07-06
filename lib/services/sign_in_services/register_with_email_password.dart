import 'package:sign_in/services/sign_in_services/abstract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailAndPasswordRegister extends AbstractSignIn {
  String email, password;
  EmailAndPasswordRegister(
      {super.setErrorOnScreen, required this.email, required this.password});

  @override
  Future checkAndReturnError(Function function) async {
    try {
      await function();
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        setErrorOnScreen!('The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        setErrorOnScreen!('The account already exists for that email');
      } else if (e.code == 'invalid-email') {
        setErrorOnScreen!('Enter a Valid Email');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future signingIn() async {
    await checkAndReturnError(_creatingWithEmailAndPassword);
  }

  Future _creatingWithEmailAndPassword() async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
