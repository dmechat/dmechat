//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of dmechatapi;

class UserModel {
  /// Returns a new [UserModel] instance.
  UserModel({
    @required this.accountName,
    @required this.publicKey,
  });

  String accountName;

  String publicKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserModel &&
     other.accountName == accountName &&
     other.publicKey == publicKey;

  @override
  int get hashCode =>
    (accountName == null ? 0 : accountName.hashCode) +
    (publicKey == null ? 0 : publicKey.hashCode);

  @override
  String toString() => 'UserModel[accountName=$accountName, publicKey=$publicKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountName'] = accountName;
      json[r'publicKey'] = publicKey;
    return json;
  }

  /// Returns a new [UserModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static UserModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : UserModel(
        accountName: json[r'accountName'],
        publicKey: json[r'publicKey'],
    );

  static List<UserModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <UserModel>[]
      : json.map((v) => UserModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, UserModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, UserModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = UserModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of UserModel-objects as value to a dart map
  static Map<String, List<UserModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = UserModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

