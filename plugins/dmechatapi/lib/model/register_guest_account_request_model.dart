//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of dmechatapi;

class RegisterGuestAccountRequestModel {
  /// Returns a new [RegisterGuestAccountRequestModel] instance.
  RegisterGuestAccountRequestModel({
    @required this.signature,
    @required this.signedMessage,
    @required this.publicKey,
  });

  String signature;

  String signedMessage;

  String publicKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterGuestAccountRequestModel &&
     other.signature == signature &&
     other.signedMessage == signedMessage &&
     other.publicKey == publicKey;

  @override
  int get hashCode =>
    (signature == null ? 0 : signature.hashCode) +
    (signedMessage == null ? 0 : signedMessage.hashCode) +
    (publicKey == null ? 0 : publicKey.hashCode);

  @override
  String toString() => 'RegisterGuestAccountRequestModel[signature=$signature, signedMessage=$signedMessage, publicKey=$publicKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'signature'] = signature;
      json[r'signedMessage'] = signedMessage;
      json[r'publicKey'] = publicKey;
    return json;
  }

  /// Returns a new [RegisterGuestAccountRequestModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RegisterGuestAccountRequestModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RegisterGuestAccountRequestModel(
        signature: json[r'signature'],
        signedMessage: json[r'signedMessage'],
        publicKey: json[r'publicKey'],
    );

  static List<RegisterGuestAccountRequestModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RegisterGuestAccountRequestModel>[]
      : json.map((v) => RegisterGuestAccountRequestModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, RegisterGuestAccountRequestModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RegisterGuestAccountRequestModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = RegisterGuestAccountRequestModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of RegisterGuestAccountRequestModel-objects as value to a dart map
  static Map<String, List<RegisterGuestAccountRequestModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RegisterGuestAccountRequestModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = RegisterGuestAccountRequestModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

