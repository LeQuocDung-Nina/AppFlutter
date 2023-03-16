import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen/favorite_screen.dart';

class LayoutFavourite extends StatelessWidget {
  const LayoutFavourite({super.key});

  static String pathRoute = '/favourite';
  static GoRoute goRoute() => GoRoute(
    path: pathRoute,
    builder: (context, state) => const FavouriteScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return const FavouriteScreen();
  }
}
