import 'package:sign_in/services/sign_in_services/abstract.dart';

class AnonymousSignIn extends AbstractSignIn {
  Future signingIn() async {
    await checkAndReturnError(_signInAnonymously);
  }

  Future _signInAnonymously() async {
    await auth.signInAnonymously();
  }
}
