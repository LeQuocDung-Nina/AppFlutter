
import 'package:demorivermod/order_list/model/orderlist_model.dart';
import 'package:demorivermod/order_list/provider/order_list_state.dart';
import 'package:demorivermod/order_list/repository/order_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class OrderListControler extends StateNotifier<OrderListState> {
  OrderListControler() : super(OrderListState()) {
    _init();
  }

  _init() async {
    final List<OrderListModel> newsList = await OrderListService.instance.getOrderList();
    state = state.copyWith(listOrder: newsList);

  }
}

