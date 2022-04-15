import 'package:dmechat/core/app_config.dart';
import 'package:dmechat/core/app_state.dart';
import 'package:dmechatapi/api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future init() async {
  //! References
  final appConfig = await AppConfig.load();
  sl.registerSingleton<AppConfig>(appConfig);
  sl.registerLazySingleton<AppState>(() => AppState());

  //! Repositories
  final apiClient = ApiClient(basePath: appConfig.apiUrl);
  apiClient.addDefaultHeader("Content-Type", "application/json");

  sl.registerSingleton<ApiClient>(apiClient);
  sl.registerLazySingleton<ApiApi>(() => ApiApi(apiClient));
  //! Core

  //! External
  sl.registerLazySingleton(() => http.Client());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);
}

//* For Changing language and using LazySingletons, use the code below
// https://pub.dev/packages/get_it#resetting-lazysingletons
