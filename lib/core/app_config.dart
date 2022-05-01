import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;
  AppConfig({@required this.apiUrl});

  static Future<AppConfig> load() async {
    const env = kReleaseMode ? "prod" : "dev";

    final contents = await rootBundle.loadString('assets/config/$env.json');
    var jsonContents = json.decode(contents);

    //! It is important that this json file is small.
    final fleetOnRouteSwaggerContent =
        await rootBundle.loadString('assets/config/dmechatapi.swagger.json');
    final version = json.decode(fleetOnRouteSwaggerContent)["version"];
    print("jsonContents: $jsonContents");
    return AppConfig(
      apiUrl: jsonContents['apiUrl'],
    );
  }
}
