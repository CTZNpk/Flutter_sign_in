class MyUser {
  final String uid;
  final String? email;
  final bool isVerified;
  bool withoutVerification;
  MyUser({required this.uid, required this.email, required this.isVerified, this.withoutVerification = false}); 
}
