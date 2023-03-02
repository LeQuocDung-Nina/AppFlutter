
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counter.dart';
import 'dashboard/dashboard_screen.dart';


class RouteConstants{
  static String dashboard = 'Dashboard';
  static String counter = 'Counter';
}

class AppRouter{
    static GoRouter router = GoRouter(routes: [
      GoRoute(
        name: RouteConstants.dashboard,
        path: '/',
        pageBuilder: (context, state) {
        return MaterialPage(child: DashboardScreen(),);
      },),
      GoRoute(
        name: RouteConstants.counter,
        path: '/counter',
        pageBuilder: (context, state) {
          return MaterialPage(child: Counter(),);
      },),
    ],
    // redirect: (context, state) async {
    //   bool isAuthenticated = true;
    //   if(!isAuthenticated && state.subloc == '/'){
    //     return state.namedLocation(RouteConstants.dashboard);
    //   }
    //   return null;
    // },
  );
}