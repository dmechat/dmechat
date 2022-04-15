//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of dmechatapi;

class RegisterGuestAccountResponseModel {
  /// Returns a new [RegisterGuestAccountResponseModel] instance.
  RegisterGuestAccountResponseModel({
    @required this.accountId,
  });

  String accountId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterGuestAccountResponseModel &&
     other.accountId == accountId;

  @override
  int get hashCode =>
    (accountId == null ? 0 : accountId.hashCode);

  @override
  String toString() => 'RegisterGuestAccountResponseModel[accountId=$accountId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountId'] = accountId;
    return json;
  }

  /// Returns a new [RegisterGuestAccountResponseModel] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RegisterGuestAccountResponseModel fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RegisterGuestAccountResponseModel(
        accountId: json[r'accountId'],
    );

  static List<RegisterGuestAccountResponseModel> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RegisterGuestAccountResponseModel>[]
      : json.map((v) => RegisterGuestAccountResponseModel.fromJson(v)).toList(growable: true == growable);

  static Map<String, RegisterGuestAccountResponseModel> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RegisterGuestAccountResponseModel>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = RegisterGuestAccountResponseModel.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of RegisterGuestAccountResponseModel-objects as value to a dart map
  static Map<String, List<RegisterGuestAccountResponseModel>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RegisterGuestAccountResponseModel>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = RegisterGuestAccountResponseModel.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

