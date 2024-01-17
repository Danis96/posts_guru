import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:js_guru/app/view/author_details/author_details.dart';
import 'package:js_guru/app/view/bottom_navigation_bar/bottom_navigation_page.dart';
import 'package:js_guru/app/view/post_details/post_details.dart';

import '../routing/routes.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: Home,
  routes: <RouteBase>[
    GoRoute(
      path: Home,
      builder: (BuildContext context, GoRouterState state) => const BottomNavigationPage(initial: 0),
      routes: <RouteBase>[
        GoRoute(
          path: PostDetails,
          builder: (BuildContext context, GoRouterState state) => const PostDetailsPage(),
        ),
        GoRoute(
          path: AuthorDetails,
          builder: (BuildContext context, GoRouterState state) => const AuthorDetailsPage(),
        ),
      ],
    ),
  ],
);
