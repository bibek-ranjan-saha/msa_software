import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:msa_software/models/users_model.dart';
import 'package:msa_software/screens/home.dart';

import '../screens/user_details.dart';

class MSASoftwareRouter{
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      name: HomePage.routeName,
      path: HomePage.routeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),    GoRoute(
      name: UserDetails.routeName,
      path: UserDetails.routeName,
      builder: (BuildContext context, GoRouterState state) {
        Users user = state.extra as Users;
        return UserDetails(user);
      },
    ),
  ]);
}