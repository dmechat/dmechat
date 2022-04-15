# dmechatapi.api.ApiApi

## Load the API package
```dart
import 'package:dmechatapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerGetHello**](ApiApi.md#appcontrollergethello) | **GET** / | 
[**loginGuest**](ApiApi.md#loginguest) | **POST** /login-guest | Allows guests login with their secret/public keys and receive a firebase auth token in return
[**registerGuestAccount**](ApiApi.md#registerguestaccount) | **POST** /register | Allows users to register an account on the guests.dmechat contract


# **appControllerGetHello**
> appControllerGetHello()



### Example 
```dart
import 'package:dmechatapi/api.dart';

final api_instance = ApiApi();

try { 
    api_instance.appControllerGetHello();
} catch (e) {
    print('Exception when calling ApiApi->appControllerGetHello: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **loginGuest**
> loginGuest(loginAccountRequestModel)

Allows guests login with their secret/public keys and receive a firebase auth token in return

### Example 
```dart
import 'package:dmechatapi/api.dart';

final api_instance = ApiApi();
final loginAccountRequestModel = LoginAccountRequestModel(); // LoginAccountRequestModel | 

try { 
    api_instance.loginGuest(loginAccountRequestModel);
} catch (e) {
    print('Exception when calling ApiApi->loginGuest: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginAccountRequestModel** | [**LoginAccountRequestModel**](LoginAccountRequestModel.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerGuestAccount**
> RegisterGuestAccountResponseModel registerGuestAccount(registerGuestAccountRequestModel)

Allows users to register an account on the guests.dmechat contract

### Example 
```dart
import 'package:dmechatapi/api.dart';

final api_instance = ApiApi();
final registerGuestAccountRequestModel = RegisterGuestAccountRequestModel(); // RegisterGuestAccountRequestModel | 

try { 
    final result = api_instance.registerGuestAccount(registerGuestAccountRequestModel);
    print(result);
} catch (e) {
    print('Exception when calling ApiApi->registerGuestAccount: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerGuestAccountRequestModel** | [**RegisterGuestAccountRequestModel**](RegisterGuestAccountRequestModel.md)|  | 

### Return type

[**RegisterGuestAccountResponseModel**](RegisterGuestAccountResponseModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

