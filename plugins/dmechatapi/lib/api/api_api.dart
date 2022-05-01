//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of dmechatapi;


class ApiApi {
  ApiApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /' operation and returns the [Response].
  Future<Response> appControllerGetHelloWithHttpInfo() async {
    final path = r'/';

    Object postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>[];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  Future<void> appControllerGetHello() async {
    final response = await appControllerGetHelloWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
  }

  /// Allows guests login with their secret/public keys and receive a firebase auth token in return
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginAccountRequestModel] loginAccountRequestModel (required):
  Future<Response> loginGuestWithHttpInfo(LoginAccountRequestModel loginAccountRequestModel) async {
    // Verify required params are set.
    if (loginAccountRequestModel == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: loginAccountRequestModel');
    }

    final path = r'/login-guest';

    Object postBody = loginAccountRequestModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Allows guests login with their secret/public keys and receive a firebase auth token in return
  ///
  /// Parameters:
  ///
  /// * [LoginAccountRequestModel] loginAccountRequestModel (required):
  Future<LoginAccountResponseModel> loginGuest(LoginAccountRequestModel loginAccountRequestModel) async {
    final response = await loginGuestWithHttpInfo(loginAccountRequestModel);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'LoginAccountResponseModel') as LoginAccountResponseModel;
        }
    return Future<LoginAccountResponseModel>.value(null);
  }

  /// Allows users to register an account on the guests.dmechat contract
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [RegisterGuestAccountRequestModel] registerGuestAccountRequestModel (required):
  Future<Response> registerGuestAccountWithHttpInfo(RegisterGuestAccountRequestModel registerGuestAccountRequestModel) async {
    // Verify required params are set.
    if (registerGuestAccountRequestModel == null) {
     throw ApiException(HttpStatus.badRequest, 'Missing required param: registerGuestAccountRequestModel');
    }

    final path = r'/register';

    Object postBody = registerGuestAccountRequestModel;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    final contentTypes = <String>['application/json'];
    final nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    final authNames = <String>[];

    if (
      nullableContentType != null &&
      nullableContentType.toLowerCase().startsWith('multipart/form-data')
    ) {
      bool hasFields = false;
      final mp = MultipartRequest(null, null);
      if (hasFields) {
        postBody = mp;
      }
    } else {
    }

    return await apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      nullableContentType,
      authNames,
    );
  }

  /// Allows users to register an account on the guests.dmechat contract
  ///
  /// Parameters:
  ///
  /// * [RegisterGuestAccountRequestModel] registerGuestAccountRequestModel (required):
  Future<RegisterGuestAccountResponseModel> registerGuestAccount(RegisterGuestAccountRequestModel registerGuestAccountRequestModel) async {
    final response = await registerGuestAccountWithHttpInfo(registerGuestAccountRequestModel);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body != null && response.statusCode != HttpStatus.noContent) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'RegisterGuestAccountResponseModel') as RegisterGuestAccountResponseModel;
        }
    return Future<RegisterGuestAccountResponseModel>.value(null);
  }
}
