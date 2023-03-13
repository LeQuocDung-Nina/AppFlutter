import 'package:demorivermod/product_detail/provider/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/product_detail_model.dart';
import '../repository/product_detail_repository.dart';


class ProductDetailController extends StateNotifier<ProductDetailState> {
  final String idProduct;

  ProductDetailController(this.idProduct) : super(ProductDetailState()) {
    _init();
  }

  void _init() async {
    final ProductDetailModel productDetail = await ProductDetailService.instance.getProductDetail(idProduct);
    state = state.copyWith(listProductDetails: [productDetail]);
  }
}

