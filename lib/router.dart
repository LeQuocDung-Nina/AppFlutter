
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'counter.dart';
import 'dashboard/dashboard_screen.dart';
import 'product_detail/product_detail.dart';


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
      GoRoute(
        path: '/product-detail/:id',
        pageBuilder: (context, state) {
          final id = state.params['id'] as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: ProductDetail(idProduct: id),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc)
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
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