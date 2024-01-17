import 'package:js_guru/app/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/MyApp.dart';
import 'config/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(flavor: Flavor.DEV, values: FlavorValues(baseUrl: App.BASE_URL, appName: App.APP_NAME));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}
