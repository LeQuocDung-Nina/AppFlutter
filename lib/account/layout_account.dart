import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/screen_account.dart';

class LayoutAccount extends StatelessWidget {
  const LayoutAccount({super.key});

  static String pathRoute = '/account';
  static GoRoute goRoute() => GoRoute(
    path: pathRoute,
    builder: (context, state) => const AccountScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return const AccountScreen();
  }
}
