import 'package:flutter/material.dart';

import '../routing/route_generator.dart';
import '../theme/custom_light_theme.dart';
import '../theme/theme_config.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: buildApp(),
    );
  }

  Widget buildApp() {
    return MaterialApp.router(
      routerConfig: router,
      title: 'JSGuru',
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(data: data.copyWith(textScaleFactor: 1.0), child: child!);
      },
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
