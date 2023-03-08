
import '../model/cart_model.dart';

class CartState {
  List<String>? selectItems;
  final List<CartModel>? listCarts;
  final bool isLoading;
  final double totalPrice;
  CartState({this.selectItems, this.listCarts,  this.totalPrice = 0, this.isLoading = true});
  CartState copyWith(
      {List<CartModel>? listCarts, List<String>? selectItems, bool? isLoading, double? totalPrice}) {
    return CartState(
        selectItems: selectItems ?? this.selectItems,
        isLoading: isLoading ?? this.isLoading,
        listCarts: listCarts ?? this.listCarts,
    totalPrice: totalPrice ?? this.totalPrice);
  }
}




