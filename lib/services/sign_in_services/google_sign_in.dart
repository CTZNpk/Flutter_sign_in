import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogle {
  signingIn() async {
    final gUser = await _displayingSignInPage();
    final gAuth = await _obtainingDetails(gUser);
    await _signingInWithCredentials(_creatingCredentials(gAuth));
  }

  Future<GoogleSignInAccount?> _displayingSignInPage() async {
    return await GoogleSignIn().signIn();
  }

  Future<GoogleSignInAuthentication> _obtainingDetails(
      GoogleSignInAccount? gUser) async {
    return await gUser!.authentication;
  }

  _creatingCredentials(GoogleSignInAuthentication gAuth) {
    return GoogleAuthProvider.credential(
        idToken: gAuth.idToken, accessToken: gAuth.accessToken);
  }

  _signingInWithCredentials(AuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
