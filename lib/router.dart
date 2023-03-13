import 'package:go_router/go_router.dart';
import 'dashboard/layout_dashboard.dart';
import 'home/layout_home.dart';
import 'product_detail/layout_product_detail.dart';



class RouteConstants{
  static String dashboard = 'Dashboard';
  static String counter = 'Counter';
}

class AppRouter{
    static GoRouter router = GoRouter(
      routes: <RouteBase>[
        LayoutDashboard.goRoute(),
        LayoutHome.goRoute(),
        LayoutProductDetail.goRoute(),
      ],
      

  );
}