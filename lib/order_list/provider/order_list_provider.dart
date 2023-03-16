import 'package:demorivermod/order_list/provider/order_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_list_notifier.dart';


final orderListProvider = StateNotifierProvider<OrderListControler, OrderListState>(
      (ref) => OrderListControler(),
);

