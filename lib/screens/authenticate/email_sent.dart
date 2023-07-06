import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in/model/my_user.dart';
import 'package:sign_in/screens/authenticate/widgets/app_bar.dart';
import 'package:sign_in/screens/authenticate/widgets/my_button.dart';
import 'package:sign_in/services/auth_service.dart';
import 'package:sign_in/shared/constants.dart';

class EmailSent extends StatefulWidget {
  final Function checkEmail;
  const EmailSent({super.key, required this.checkEmail});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  final _auth = AuthService();
  Timer? timer;

  @override
  void initState() {
    super.initState();

    _auth.sendingVerificationEmail();
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => widget.checkEmail(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    final myTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: myTheme.colorScheme.background,
      appBar: const MyAuthenticateAppBar(title: 'Email Sent'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: applyPadding,
            child: Text(
              'An email has been sent to ${user?.email}. Please check your inbox.',
              style: myTheme.textTheme.displayMedium?.copyWith(
                color: myTheme.colorScheme.secondary,
              ),
            ),
          ),
          verticalSpace,
          MyButton(
            onPressed: () {
              _auth.sendingVerificationEmail();
            },
            label: 'Resend Email',
            icon: Icons.mail,
          ),
        ],
      ),
    );
  }
}
