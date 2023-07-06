import 'package:flutter/material.dart';
import 'package:sign_in/screens/authenticate/widgets/app_bar.dart';
import 'package:sign_in/screens/authenticate/widgets/my_button.dart';
import 'package:sign_in/shared/constants.dart';

class VerifyEmailOrContinue extends StatefulWidget {
  final Function passWithoutVerfication;
  final Function sendEmail;
  const VerifyEmailOrContinue(
      {super.key,
      required this.passWithoutVerfication,
      required this.sendEmail});

  @override
  State<VerifyEmailOrContinue> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmailOrContinue> {
  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: myTheme.colorScheme.background,
      appBar: const MyAuthenticateAppBar(title: 'Email Verification'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: applyPadding,
            child: Text(
              "If you wish to continue without verification you will not be able to access some features of this app.",
              style: myTheme.textTheme.displayMedium
                  ?.copyWith(color: myTheme.colorScheme.secondary),
            ),
          ),
          verticalSpace,
          MyButton(
            onPressed: () =>widget.sendEmail(),
            label: 'Verify Email',
          ),
          verticalSpace,
          MyButton(
            onPressed: () =>widget.passWithoutVerfication(),
            label: 'Continue Without Verification',
          ),
        ],
      ),
    );
  }
}
