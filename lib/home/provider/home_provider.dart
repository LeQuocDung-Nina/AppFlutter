
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';
import 'home_state.dart';

// final productProvider = FutureProvider.autoDispose<List<ProductModel>?>((_){
//   final productService = ProductService.instance;
//   return productService.getProducts();
// });


class ProductControler extends StateNotifier<ProductState> {
  ProductControler() : super(ProductState()) {
    _init();
  }

  _init() async {
    final List<ProductModel>? a = await ProductService.instance.getProducts();
    state = state.copyWith(listProducts: a);
  }
}

final productProvider = StateNotifierProvider<ProductControler, ProductState>(
      (ref) => ProductControler(),
);