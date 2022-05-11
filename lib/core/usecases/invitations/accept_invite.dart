import 'dart:math';

import 'package:dmechat/core/app_state.dart';
import 'package:firebase_database/firebase_database.dart';

acceptInvite(
  AppState appState,
  String myPublicKey,
  String myAccountName,
  String otherPublicKey,
  String otherAccountName,
) async {
  var root = FirebaseDatabase.instanceFor(app: appState.firebase);

  // need a better way to generate random roomId
  var roomId = Random().nextInt(1 << 32).toString();

  // add to contact
  await root
      .ref("users")
      .child(myPublicKey)
      .child("contacts")
      .child(otherPublicKey)
      .update({"accountName": myAccountName, "roomId": roomId});

  // create the room
  await root.ref("rooms").child(roomId).set({
    "participants": [myAccountName, otherAccountName]
  });

  // delete record from invites
  await root
      .ref("users")
      .child(myPublicKey)
      .child("invitations")
      .child(otherPublicKey)
      .remove();
}
