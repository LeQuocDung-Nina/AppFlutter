import 'dart:convert';
import 'package:demorivermod/order_list/model/orderlist_model.dart';
import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';


class OrderListService{
  OrderListService._();
  static final instance = OrderListService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_ORDERlIST;

  Future<List<OrderListModel>> getOrderList() async {
    List<OrderListModel>? listOrder = [];
    try{
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final mapResponse = jsonDecode(response.data)['data'];
        for(var orderItem in mapResponse){
          listOrder.add(OrderListModel.fromJson(orderItem));
        }
        return listOrder;
      }else{
        throw Exception('Failed to load order list');
      }
    } catch (error){
      throw Exception('Failed to connect to the server');
    }
  }
}

