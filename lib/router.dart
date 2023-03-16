import 'package:go_router/go_router.dart';
import 'account/layout_account.dart';
import 'dashboard/layout_dashboard.dart';
import 'home/layout_home.dart';
import 'info_account/layout_info_account.dart';
import 'login/layout_login.dart';
import 'order_detail/layout_order_detail.dart';
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
        LayoutOrderDetail.goRoute(),
        LayoutAccount.goRoute(),
        LayoutLogin.goRoute(),
        LayoutInfoAccount.goRoute(),
      ],
      

  );
}