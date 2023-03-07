
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../product_detail/adapter/Item_cart_hive.dart';
import '../model/cart_model.dart';
import 'cart_state.dart';

class CartControler  extends StateNotifier<CartState> {
  CartControler () : super(CartState()) {
    initCart();
  }
  late final _boxCart;

  initCart() async {
    state = state.copyWith(isLoading: true);

    _boxCart = Hive.box('person_listCart');
    final listCarts = _boxCart.toMap();
    List<CartModel> listTemp = [];
    if (listCarts.isNotEmpty && listCarts.length > 0) {
      listCarts.forEach((key, value) {
        final itemPro = value as ItemCartHive;
        listTemp.add(CartModel(
            id: itemPro.id,
            regularPrice: itemPro.regular_price,
            photo: itemPro.photo,
            namevi: itemPro.namevi
        ));
      });
    }
    state = state.copyWith(isLoading: false, listCarts: listTemp);

  }
}
