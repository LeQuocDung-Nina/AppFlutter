import 'package:demorivermod/order_list/model/orderlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../color.dart';

class OrderItem extends ConsumerWidget {
  const OrderItem({required this.orderListModel,
    Key? key,
  }) : super(key: key);

  final OrderListModel orderListModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mã đơn hàng: ${orderListModel.code}",style: const TextStyle(fontSize: 16),),
                Text("Họ tên: ${orderListModel.fullname}",style: const TextStyle(fontSize: 16),),
                Text("Số điện thoại: ${orderListModel.phone}",style: const TextStyle(fontSize: 16),),
                Text("Tổng giá: ${orderListModel.total_price}đ",style: const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.push('/order-detail/${orderListModel.id}');
                  },
                style: ElevatedButton.styleFrom(primary: color_lqd9,onPrimary: color_lqd4,elevation: 0, minimumSize: const Size(10, 45)),
                child:const Icon(Icons.edit)),
              const SizedBox(width: 10,),
              ElevatedButton(
                  onPressed: () {
              },
                  style: ElevatedButton.styleFrom(primary: color_lqd9,onPrimary: color_lqd4,elevation: 0, minimumSize: const Size(10, 45)),
                  child:const Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
  }
}
