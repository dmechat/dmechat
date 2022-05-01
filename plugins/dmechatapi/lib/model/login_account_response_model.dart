//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of dmechatapi;

class LoginAccountResponseModel {
  /// Returns a new [LoginAccountResponseModel] instance.
  LoginAccountResponseModel({
    @required this.signInToken,
  });

  String signInToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginAccountResponseModel &&
     other.signInToken == signInToken;

  @override
  int get hashCode =>
    (signInToken == null ? 0 : signInToken.hashCode);

  @override
  String toString() => 'LoginAccountResponseModel[signInToken=$signInToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'signInToken'] = signInToken;
    return json;
  }

  /// Returns a new [LoginAccountResponseModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static LoginAccountResponseModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : LoginAccountResponseModel(
        signInToken: json[r'signInToken'],
    );

  static List<LoginAccountResponseModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginAccountResponseModel>[]
      : json.map((v) => LoginAccountResponseModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, LoginAccountResponseModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LoginAccountResponseModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = LoginAccountResponseModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of LoginAccountResponseModel-objects as value to a dart map
  static Map<String, List<LoginAccountResponseModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginAccountResponseModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = LoginAccountResponseModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

