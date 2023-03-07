import 'dart:convert';

import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';


class ProductDetailService{
  ProductDetailService._();
  static final instance = ProductDetailService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_RANDOM_4;

  Future<ProductDetailModel> getProductDetail(int id) async {
    List<ProductDetailModel>? listProducts = [];
    final response = await Dio().get('$url?id=$id');

    if (response.statusCode == 200) {
      final mapResponse = jsonDecode(response.data)['data'][0];
      listProducts.add(ProductDetailModel.fromJson(mapResponse));
    }
    return listProducts[0];
  }

}
