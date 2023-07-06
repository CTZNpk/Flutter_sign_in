import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  final bool obscureText;
  final String label;
  final Function getValue;
  final Function? validator;
  const LoginTextForm(
      {super.key,
      this.obscureText = false,
      required this.label,
      required this.getValue,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    return TextFormField(
      validator: (val) => validator!(val),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: myTheme.colorScheme.onSurface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: myTheme.colorScheme.outline,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: myTheme.colorScheme.primary,
            width: 2,
          ),
        ),
      ),
      onChanged: (val) => getValue(val),
    );
  }
}
