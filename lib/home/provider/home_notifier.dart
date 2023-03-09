import 'package:demorivermod/home/model/slideshow_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home_model.dart';
import '../repository/home_repository.dart';
import 'home_state.dart';

class ProductControler extends StateNotifier<ProductState> {
  ProductControler() : super(ProductState()) {
    _init();
  }

  _init() async {
    final List<ProductModel>? a = await ProductService.instance.getProducts();
    state = state.copyWith(listProducts: a);
  }
}



class SlideshowControler extends StateNotifier<SlideshowState> {
  SlideshowControler() : super(SlideshowState()) {
    _initSlideshow();
  }

  _initSlideshow() async {
    state = state.copyWith(isLoading: true);
    final List<SlideshowModel>? listSlideshowNew = await SlideshowService.instance.getSlideshows();
    state = state.copyWith(isLoading: false, listSlideshows: listSlideshowNew);
  }

  // late final _boxCart;

// initCart() async {
//   state = state.copyWith(isLoading: true);
//   _boxCart = Hive.box('box_listCart');
//   final listCarts = _boxCart.toMap();
//   List<CartModel> listTemp = [];
//   if (listCarts.isNotEmpty && listCarts.length > 0) {
//     listCarts.forEach((key, value) {
//       final itemPro = value as ItemCartHive;
//       listTemp.add(CartModel(
//           id: itemPro.id,
//           regular_price: itemPro.regular_price,
//           quantity: itemPro.quantity,
//           photo: itemPro.photo,
//           namevi: itemPro.namevi
//       ));
//     });
//   }
//   state = state.copyWith(isLoading: false, listCarts: listTemp);
// }

}