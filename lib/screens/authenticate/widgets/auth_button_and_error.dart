import 'package:flutter/material.dart';
import 'package:sign_in/screens/authenticate/widgets/my_button.dart';
import 'package:sign_in/shared/constants.dart';

class AuthButtonAndError extends StatelessWidget {
  final Function onButtonPressed;
  final String buttonText;
  final String error;

  const AuthButtonAndError({
    super.key,
    required this.onButtonPressed,
    required this.error,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(onPressed: onButtonPressed, label: buttonText),
        verticalSpace,
        ShowIfError(
          error: error,
        ),
      ],
    );
  }
}

class ShowIfError extends StatelessWidget {
  final String error;
  const ShowIfError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    if (error == '') {
      return const SizedBox.shrink();
    } else {
      return Column(
        children: [
          Text(
            error,
            style: myTheme.textTheme.labelLarge
                ?.copyWith(color: myTheme.colorScheme.error),
          ),
          verticalSpace,
        ],
      );
    }
  }
}
