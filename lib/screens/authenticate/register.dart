import 'package:flutter/material.dart';
import 'package:sign_in/screens/authenticate/widgets/auth_button_and_error.dart';
import 'package:sign_in/screens/authenticate/widgets/login_text_form.dart';
import 'package:sign_in/services/auth_service.dart';
import 'package:sign_in/shared/constants.dart';
import 'widgets/app_bar.dart';
import 'widgets/login_form.dart';
import 'package:sign_in/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggle;
  const Register({super.key, required this.toggle});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  void getEmail(String val) => email = val;
  void getPassword(String val) => password = val;
  void getConfirmPassword(String val) => confirmPassword = val;

  void setErrorOnScreen(String er) {
    setState(() {
      error = er;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    Future onButtonPressed() async {
      setErrorOnScreen('');
      if (_formKey.currentState!.validate()) {
        setState(() => loading = true);
        await _auth.creatingUserWithEmailAndPassword(
            email: email, password: password, setError: setErrorOnScreen);
      }
    }

    return loading
        ? const Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: myTheme.colorScheme.background,
            appBar: MyAuthenticateAppBar(
              title: 'Register Page',
              actions: [
                TextButton.icon(
                  onPressed: () => widget.toggle(),
                  icon: const Icon(Icons.person),
                  label: const Text('Sign In'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(myTheme.colorScheme.primary),
                    foregroundColor:
                        MaterialStatePropertyAll(myTheme.colorScheme.onSurface),
                  ),
                ),
              ],
            ),
            body: Container(
              padding: applyPadding,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginForm(
                      getEmail: getEmail,
                      getPassword: getPassword,
                    ),
                    verticalSpace,
                    LoginTextForm(
                      label: 'Confirm Password',
                      getValue: getConfirmPassword,
                      obscureText: true,
                      validator: (val) =>
                          val != password ? 'Passwords do not match' : null,
                    ),
                    verticalSpace,
                    AuthButtonAndError(
                      onButtonPressed: onButtonPressed,
                      error: error,
                      buttonText: 'Register',
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
