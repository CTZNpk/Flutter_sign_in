import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in/model/my_user.dart';
import 'authenticate/authenticate.dart';
import 'Home/home.dart';
import 'authenticate/verify_email.dart';
import 'authenticate/email_sent.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool sendEmail = false;

  void sendVerificationEmail() {
    setState(() {
      sendEmail = true;
    });
  }

  void checkUser() {
      FirebaseAuth.instance.currentUser!.reload();
  }

  @override
  Widget build(BuildContext context) {
    MyUser? user = Provider.of<MyUser?>(context);
    void passWithoutVerification() {
      setState(() {
        user?.withoutVerification = true;
      });
    }

    if (user == null) {
      sendEmail = false;
      return const Authenticate();
    } else if (user.isVerified == false &&
        user.withoutVerification == false &&
        sendEmail == false) {
      return VerifyEmailOrContinue(
        sendEmail: sendVerificationEmail,
        passWithoutVerfication: passWithoutVerification,
      );
    } else if (sendEmail && user.isVerified == false) {
      return EmailSent(
        checkEmail: checkUser,
      );
    } else {
      return const Home();
    }
  }
}
