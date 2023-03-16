
import '../model/order_detail_model.dart';

class OrderDetailState {
  final List<OrderDetailModel>? listOrderDetails;
  final bool isLoading;

  OrderDetailState({this.listOrderDetails, this.isLoading = true});

  OrderDetailState copyWith(
      {List<OrderDetailModel>? listOrderDetails, bool? isLoading}) {
    return OrderDetailState(
        isLoading: isLoading ?? this.isLoading,
        listOrderDetails: listOrderDetails ?? this.listOrderDetails
    );
  }
}




