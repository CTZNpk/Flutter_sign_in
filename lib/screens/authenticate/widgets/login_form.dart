import 'package:flutter/material.dart';
import 'package:sign_in/shared/constants.dart';
import 'login_text_form.dart';

class LoginForm extends StatelessWidget {
  final Function getEmail;
  final Function getPassword;
  const LoginForm({
    super.key,
    required this.getEmail,
    required this.getPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace,
        LoginTextForm(
          label: 'Email',
          getValue: getEmail,
          validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
        ),
        verticalSpace,
        LoginTextForm(
          validator: (val) => val!.length < 6
              ? 'Password should be greater than 6 characters'
              : null,
          label: 'Password',
          obscureText: true,
          getValue: getPassword,
        ),
      ],
    );
  }
}
