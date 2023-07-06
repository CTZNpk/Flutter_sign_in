import 'dart:async';
import 'package:sign_in/model/my_user.dart';
import 'package:sign_in/services/sign_in_services/abstract.dart';
import 'package:sign_in/services/sign_in_services/anonymous.dart';
import 'package:sign_in/services/sign_in_services/email_password.dart';
import 'package:sign_in/services/sign_in_services/email_verification.dart';
import 'package:sign_in/services/sign_in_services/google_sign_in.dart';
import 'package:sign_in/services/sign_in_services/register_with_email_password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Stream<MyUser?> get user {
    return AbstractSignIn().userStream();
  }

  Future signingInAnonymously() async {
    await AnonymousSignIn().signingIn();
  }

  Future signingInWithEmailAndPassword(
      {required String email,
      required String password,
      Function? setError}) async {
    await EmailAndPasswordSignIn(
            email: email, password: password, setErrorOnScreen: setError)
        .signingIn();
  }

  Future signingInWithGoogle() async{
    await SignInWithGoogle().signingIn();
  }

  Future creatingUserWithEmailAndPassword(
      {required String email,
      required String password,
      Function? setError}) async {
    await EmailAndPasswordRegister(
            email: email, password: password, setErrorOnScreen: setError)
        .signingIn();
  }

  Future sendingVerificationEmail() async {
    await EmailVerification().sendingEmail();
  }

  Future signingOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
