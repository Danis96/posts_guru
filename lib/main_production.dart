import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/MyApp.dart';
import 'app/utils/constants/constants.dart';
import 'config/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.PRODUCTION, values: FlavorValues(baseUrl: App.BASE_URL, appName: App.APP_NAME));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}
