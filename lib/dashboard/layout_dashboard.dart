import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/dashboard_screen.dart';


class LayoutDashboard extends StatelessWidget {
  const LayoutDashboard({super.key});

  static String pathRoute = '/';
  static GoRoute goRoute() => GoRoute(
    path: pathRoute,
    builder: (context, state) => const DashboardScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
