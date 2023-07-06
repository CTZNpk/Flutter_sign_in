import 'package:sign_in/services/sign_in_services/abstract.dart';

class EmailVerification extends AbstractSignIn {
  Future sendingEmail() async {
    checkAndReturnError(_sendVerificationEmail);
  }

  Future _sendVerificationEmail() async {
    await auth.currentUser!.sendEmailVerification();
  }
}
