
import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:demorivermod/product_detail/provider/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/product_detail_repository.dart';


class ProductDetailControler  extends StateNotifier<ProductDetailState> {
  ProductDetailControler () : super(ProductDetailState()) {
    _init();
  }

  _init() async {
    final ProductDetailModel a = await ProductDetailService.instance.getProductDetail(27);
    state = state.copyWith(listProducts: [a]);
  }
}

final productProvider = StateNotifierProvider<ProductDetailControler , ProductDetailState>(
      (ref) => ProductDetailControler (),
);