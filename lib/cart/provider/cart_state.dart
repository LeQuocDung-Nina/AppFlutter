
import '../model/cart_model.dart';

class CartState {
  final List<dynamic>? listCarts;
  final bool isLoading;
  CartState({this.listCarts, this.isLoading = true});
  CartState copyWith(
      {List<CartModel>? listCarts, bool? isLoading}) {
    return CartState(
        isLoading: isLoading ?? this.isLoading,
        listCarts: listCarts ?? this.listCarts);
  }
}




