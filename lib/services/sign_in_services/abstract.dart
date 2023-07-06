import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in/model/my_user.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class AbstractSignIn {
  Function? setErrorOnScreen;
  AbstractSignIn({this.setErrorOnScreen});
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<MyUser?> userStream() {
    return auth.userChanges().map(_myUserFromUser);
  }

  MyUser? _myUserFromUser(User? user) {
    return user != null
        ? MyUser(
            uid: user.uid,
            isVerified: user.emailVerified,
            email: user.email,
          )
        : null;
  }

  Future checkAndReturnError(Function function) async {
    try {
      await function();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
