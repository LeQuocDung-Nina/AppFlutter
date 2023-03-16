


import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_detail_notifier.dart';
import 'order_detail_state.dart';

final orderDetailProvider = StateNotifierProvider.family<OrderDetailController, OrderDetailState, String>((ref, idOrder) {
  return OrderDetailController(idOrder);
});