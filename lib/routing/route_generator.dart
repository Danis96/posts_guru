import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:js_guru/app/providers/posts_provider/posts_provider.dart';
import 'package:js_guru/app/view/bottom_navigation_bar/bottom_navigation_page.dart';

import 'package:js_guru/routing/route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../app/utils/navigation_animations.dart';
import '../routing/routes.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: Home,
  routes: <RouteBase>[
    GoRoute(
      path: Home,
      builder: (BuildContext context, GoRouterState state) =>
          ChangeNotifierProvider<PostsProvider>(create: (_) => PostsProvider(), child: const BottomNavigationPage(initial: 0)),
    ),
  ],
);

// mixin RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Splash:
//         return SlideAnimationTween(
//             widget: Provider<SplashProvider>(create: (_) => SplashProvider(defaultRoute: Login), lazy: false, child: SplashPage()));
//       case Home:
//         return SlideAnimationTween(
//             widget: MultiProvider(
//           providers: <SingleChildWidget>[
//             // ChangeNotifierProvider<AppointmentProvider>(create: (_) => AppointmentProvider()),
//             // ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
//             // ChangeNotifierProvider<StupidityProvider>(create: (_) => StupidityProvider()),
//           ],
//           child: const BottomNavigationPage(initial: 1),
//         ));
//
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute<void>(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Error')),
//         body: Center(
//           child: Container(
//             child: const Text('Error Screen'),
//           ),
//         ),
//       );
//     });
//   }
// }
