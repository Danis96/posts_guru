import 'package:flutter/material.dart';

import 'app/MyApp.dart';
import 'app/utils/constants/constants.dart';
import 'config/flavor_config.dart';

void main() {
  FlavorConfig(flavor: Flavor.QA, values: FlavorValues(baseUrl: App.BASE_URL, appName: App.APP_NAME));
  runApp(MyApp());
}
