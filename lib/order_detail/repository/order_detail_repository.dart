import 'dart:convert';

import 'package:demorivermod/order_detail/model/order_detail_model.dart';
import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';

class OrderDetailService{
  OrderDetailService._();
  static final instance = OrderDetailService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_ORDERDetail;

  Future<OrderDetailModel> getOrderDetail(String id) async {
    // List<ProductDetailModel>? listProducts = [];
    try{
      final response = await Dio().get('$url?id_order=$id');

      if (response.statusCode == 200) {
        final mapResponse = jsonDecode(response.data)['data'][0];

        return OrderDetailModel.fromJson(mapResponse);
      }else{
        throw Exception('Failed to load product details');
      }
    } catch (error){
      throw Exception('Failed to connect to the server');
    }
  }
}
