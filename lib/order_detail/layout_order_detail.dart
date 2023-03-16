import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/screen_order_detail.dart';


class LayoutOrderDetail extends StatelessWidget {
  const LayoutOrderDetail({super.key, required this.id});

  final String id;

  static String pathRoute = '/order-detail';
  static GoRoute goRoute() => GoRoute(
    path: "$pathRoute/:id",
    builder: (context, state) {
      return OrderDetail(
        idOrder: state.params['id'].toString(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return OrderDetail(idOrder: id);
  }
}
