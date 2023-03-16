import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/order_list_screen.dart';
class LayoutOrderList extends StatelessWidget {
  const LayoutOrderList({super.key});

  static String pathRoute = '/home';
  static GoRoute goRoute() => GoRoute(
    path: pathRoute,
    builder: (context, state) => const OrderListScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return const OrderListScreen();
  }
}
