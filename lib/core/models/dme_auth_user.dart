import 'package:firebase_auth/firebase_auth.dart';

class DMEAuthUser {
  String displayName;
  String refreshToken;
  String uid;
  String idToken;
  DMEAuthUser({
    this.displayName,
    this.refreshToken,
    this.uid,
    this.idToken,
  });
  DMEAuthUser.fromUser(User user, String idToken) {
    this.displayName = user.displayName;
    this.refreshToken = user.refreshToken;
    this.uid = user.uid;
    this.idToken = idToken;
  }
  static Map<String, dynamic> toJson(DMEAuthUser value) => {
        'displayName': value.displayName,
        'refreshToken': value.refreshToken,
        'uid': value.uid,
        'idToken': value.idToken,
      };
}
