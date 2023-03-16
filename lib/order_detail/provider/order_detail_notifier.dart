

import 'package:demorivermod/order_detail/model/order_detail_model.dart';
import 'package:demorivermod/order_detail/repository/order_detail_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_detail_state.dart';

class OrderDetailController extends StateNotifier<OrderDetailState> {
  final String idOrder;

  OrderDetailController(this.idOrder) : super(OrderDetailState()) {
    _init();

  }

  void _init() async {
    final OrderDetailModel orderDetail = await OrderDetailService.instance.getOrderDetail(idOrder);
    state = state.copyWith(listOrderDetails: [orderDetail]);
  }

}

