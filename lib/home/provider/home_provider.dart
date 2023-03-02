

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/home_model.dart';
import '../repository/home_repository.dart';

final productProvider = FutureProvider.autoDispose<List<ProductModel>?>((_){
  final productService = ProductService.instance;
  return productService.getProducts();
});