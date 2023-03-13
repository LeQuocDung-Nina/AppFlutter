import 'dart:convert';

import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';


class ProductDetailService{
  ProductDetailService._();
  static final instance = ProductDetailService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_RANDOM_4;

  Future<ProductDetailModel> getProductDetail(String id) async {
    // List<ProductDetailModel>? listProducts = [];
    try{
      final response = await Dio().get('$url?id=$id');

      if (response.statusCode == 200) {
        final mapResponse = jsonDecode(response.data)['data'][0];
        return ProductDetailModel.fromJson(mapResponse);
      }else{
        throw Exception('Failed to load product details');
      }
    } catch (error){
      throw Exception('Failed to connect to the server');
    }
  }
}
