
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

    _boxCart = Hive.box('box_listCart2');

    final listCarts = _boxCart.toMap();
    List<CartModel> listTemp = [];
    if (listCarts.isNotEmpty && listCarts.length > 0) {
      listCarts.forEach((key, value) {
        final itemPro = value as ItemCartHive;
        listTemp.add(CartModel(
            id: itemPro.id,
            regular_price: itemPro.regular_price,
            quantity: itemPro.quantity,
            photo: itemPro.photo,
            namevi: itemPro.namevi
        ));
      });
    }
    state = state.copyWith(isLoading: false, listCarts: listTemp);
  }

  int totalItemsCart() {
    List<CartModel> newsList = [];
    for (CartModel cartItem in state.listCarts!) {
      if (state.selectItems!.contains(cartItem.id)) {
        newsList.add(cartItem);
      }
    }
    return (newsList!.isNotEmpty)
        ? newsList!.map((e) => int.parse(e.quantity)).reduce((a, b) => a + b)
        : 0;
  }


  _updateTotalPrice() {
    List<CartModel> newsList = [];
    for (CartModel cartItem in state.listCarts!) {
      if (state.selectItems!.contains(cartItem.id)) {
        newsList.add(cartItem);
      }
    }

    int total = (newsList!.isNotEmpty)
        ? newsList!.map((e) {
          final total = int.parse(e.regular_price)*int.parse(e.quantity);
          return total;
    }).reduce((a, b) => a + b)
        : 0;
    state = state.copyWith(totalPrice: double.parse(total.toString()));
  }

  listCheckCart({required String id}){
     List<String>? curList = state.selectItems ?? [];
    if(curList.isNotEmpty){
      int index = _findIndexList(id: id);
      if(index>-1){
        curList.removeAt(index);
      }else{
        curList.add(id);
      }
    }else{
      curList.add(id);
    }
    state = state.copyWith(selectItems: curList);
     _updateTotalPrice();
  }

  _findIndexList({required String id}){
    return state.selectItems?.indexWhere((element) => element == id);
  }

  checkAll({required bool isChecked}){
    List<String>? newList = [];
    if(!isChecked){
      for(CartModel cartItem in state.listCarts!){
        newList.add(cartItem.id);
      }
    }
    state = state.copyWith(selectItems: newList);
    _updateTotalPrice();
  }

  addCart({required CartModel item, int quantity = 1}) async {
    state = state.copyWith(isLoading: true);
    int index = state.listCarts!.indexWhere((element) => element.id == item.id);

    if (index > -1) {
      quantity = int.parse(state.listCarts![index].quantity) + quantity;
      state.listCarts![index] = state.listCarts![index].copyWith(quantity: quantity.toString());
    } else {
      state.listCarts!.add(item);
    }

    updateCartLocalStorage();
    state = state.copyWith(isLoading: false);
    _updateTotalPrice();
  }



  deleteCart({required CartModel item}) async {
    state = state.copyWith(isLoading: true);
    final viTriXoa =
    state.listCarts!.indexWhere((element) => element.id == item.id);
    final listTemp = state.listCarts!.where((element) => element.id != item.id).toList() as dynamic;
    _boxCart.deleteAt(viTriXoa);
    state = state.copyWith(isLoading: false, listCarts: listTemp);
    _updateTotalPrice();
  }

  decreaseCart({required CartModel item, int quantity = 1}) async {
    if (int.parse(item.quantity) > 1) {
      state = state.copyWith(isLoading: true);
      final viTri =
      state.listCarts!.indexWhere((element) => element.id == item.id);
      if (viTri > -1) {
        quantity = int.parse(item.quantity) - quantity;
        state.listCarts![viTri] =
            state.listCarts![viTri].copyWith(quantity: quantity.toString());
        updateCartLocalStorage();
      }
      state = state.copyWith(isLoading: false);
    }
    else{
      final viTrixoa =
      state.listCarts!.indexWhere((element) => element.id == item.id);
      final listTemp = state.listCarts!.where((element) => element.id != item.id).toList() as dynamic;
      _boxCart.deleteAt(viTrixoa);
      int indexSelectItem = _findIndexList(id: item.id);
      state.selectItems?.removeAt(indexSelectItem);
      state = state.copyWith(isLoading: false, listCarts: listTemp);
    }
    _updateTotalPrice();
  }

  increaseCart({required CartModel item, int quantity = 1}) async {
    state = state.copyWith(isLoading: true);
    final viTri =
    state.listCarts!.indexWhere((element) => element.id == item.id);
    if (viTri > -1) {
      quantity = int.parse(item.quantity) + quantity;
      state.listCarts![viTri] =
          state.listCarts![viTri].copyWith(quantity: quantity.toString());
      updateCartLocalStorage();
    }
    state = state.copyWith(isLoading: false);
    _updateTotalPrice();
  }

  updateCartLocalStorage() async {
    await _boxCart.clear();
    if (state.listCarts!.isNotEmpty) {
      for (var element in state.listCarts!) {
        ItemCartHive item = ItemCartHive(
        id: element.id,
        namevi: element.namevi,
        quantity: element.quantity,
        regular_price: element.regular_price,
        photo: element.photo!);
        _boxCart.add(item);
      }
    }
  }
}
