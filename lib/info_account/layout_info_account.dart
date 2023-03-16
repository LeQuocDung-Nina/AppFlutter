

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/info_account_sreen.dart';


class LayoutInfoAccount extends StatelessWidget {
  const LayoutInfoAccount({super.key});

  static String pathRoute = '/info-account';
  static GoRoute goRoute() => GoRoute(
    path: pathRoute,
    builder: (context, state) => const InfoAccountScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return const InfoAccountScreen();
  }
}

