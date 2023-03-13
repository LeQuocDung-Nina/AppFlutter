
import 'package:demorivermod/product_detail/provider/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_detail_notifier.dart';


final productDetailProvider = StateNotifierProvider.family<ProductDetailController, ProductDetailState, String>((ref, idProduct) {
  return ProductDetailController(idProduct);
});