
import 'package:demorivermod/order_list/model/orderlist_model.dart';

class OrderListState {
  final List<OrderListModel>? listOrder;
  final bool isLoading;

  OrderListState({this.listOrder, this.isLoading = true});

  OrderListState copyWith({List<OrderListModel>? listOrder, bool? isLoading}) {
    return OrderListState(
        isLoading: isLoading ?? this.isLoading,
        listOrder: listOrder ?? this.listOrder);
  }
}