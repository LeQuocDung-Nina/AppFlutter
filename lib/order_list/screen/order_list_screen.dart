import 'package:demorivermod/order_list/provider/order_list_provider.dart';
import 'package:demorivermod/order_list/widget/order_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OrderListScreen extends ConsumerWidget {
  const OrderListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách đơn hàng"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
          child: _OrderList())

    );
  }
}

class _OrderList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderList = ref.watch(orderListProvider);
    return (orderList.listOrder != null)
      ? AlignedGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orderList.listOrder!.length,
      crossAxisCount: 1,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      itemBuilder: (context, index) =>  OrderItem(orderListModel: orderList.listOrder![index]),
    )
        :const Center(child: CircularProgressIndicator());
  }
}
