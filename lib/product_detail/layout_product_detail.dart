import 'package:demorivermod/product_detail/screen/screen_product_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LayoutProductDetail extends StatelessWidget {
  const LayoutProductDetail({super.key, required this.id});

  final String id;

  static String pathRoute = '/product-detail';
  static GoRoute goRoute() => GoRoute(
    path: "$pathRoute/:id",
    builder: (context, state) {
      return ProductDetail(
        idProduct: state.params['id'].toString(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return ProductDetail(idProduct: id);
  }
}


