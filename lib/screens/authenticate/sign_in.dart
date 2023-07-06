import 'package:flutter/material.dart';
import 'package:sign_in/screens/authenticate/widgets/auth_button_and_error.dart';
import 'package:sign_in/screens/authenticate/widgets/my_button.dart';
import 'package:sign_in/services/auth_service.dart';
import 'package:sign_in/shared/constants.dart';
import 'widgets/app_bar.dart';
import 'widgets/login_form.dart';
import 'package:sign_in/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  const SignIn({super.key, required this.toggle});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  void getPassword(String val) => password = val;
  void getEmail(String val) => email = val;

  void setErrorOnScreen(String er) {
    setState(() {
      loading = false;
      error = er;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myTheme = Theme.of(context);
    Future onButtonPressed() async {
      if (_formKey.currentState!.validate()) {
        setState(() => loading = true);
        await _auth.signingInWithEmailAndPassword(
            email: email, password: password, setError: setErrorOnScreen);
      }
    }

    return loading
        ? const Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: myTheme.colorScheme.background,
            appBar: MyAuthenticateAppBar(
              title: 'Sign In Page',
              actions: [
                TextButton.icon(
                  onPressed: () => widget.toggle(),
                  icon: const Icon(Icons.person),
                  label: const Text('Register'),
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
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: LoginForm(
                      getEmail: getEmail,
                      getPassword: getPassword,
                    ),
                  ),
                  verticalSpace,
                  AuthButtonAndError(
                    onButtonPressed: onButtonPressed,
                    error: error,
                    buttonText: 'Sign In',
                  ),
                  MyButton(
                    onPressed: () async{
                      loading = true;
                      await _auth.signingInWithGoogle();
                      loading = false;
                    },
                    label: 'Sign In with Google',
                    image:
                        'http://pngimg.com/uploads/google/google_PNG19635.png',
                  ),
                  verticalSpace,
                ],
              ),
            ),
          );
  }
}
