import 'package:demorivermod/order_detail/model/product_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../color.dart';

class ProductOrderItem extends ConsumerWidget {
  const ProductOrderItem({required this.productOrderModel,
    Key? key,
  }) : super(key: key);

  final ProductOrderModel productOrderModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int totalPrice = int.parse(productOrderModel.regular_price) * int.parse(productOrderModel.quantity);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
        color: color_lqd13,
        border: Border.all(color: color_lqd13),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                  child: Image.network(productOrderModel.photo))),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Tên sản phẩm: ${productOrderModel.name}",style: const TextStyle(fontSize: 14),),
                Text("giá bán: ${productOrderModel.regular_price}",style: const TextStyle(fontSize: 14),),
                Text("Số lượng: ${productOrderModel.quantity}",style: const TextStyle(fontSize: 14),),
                Text("Tổng giá: ${totalPrice.toString()}",style: const TextStyle(fontSize: 14),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
