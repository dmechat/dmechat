import 'package:dmechat/core/app_state.dart';
import 'package:firebase_database/firebase_database.dart';

registerToFirebase(
  AppState appState,
  String publicKey,
  String accountId,
) async {
  var root = FirebaseDatabase.instanceFor(app: appState.firebase);

  await root.ref("users").child(publicKey).set({"accountId": accountId});
}
