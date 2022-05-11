import 'package:dmechat/core/app_state.dart';
import 'package:firebase_database/firebase_database.dart';

inviteUser(
  AppState appState,
  String pubKeyUserToInvite,
  String myPubKey,
  String myAccountId,
) async {
  var root = FirebaseDatabase.instanceFor(app: appState.firebase);
  await root
      .ref("users")
      .child(pubKeyUserToInvite)
      .child("invitations")
      .child(myPubKey)
      .update({"accountId": myAccountId});
}
