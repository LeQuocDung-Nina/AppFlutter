import 'dart:convert';

import 'package:demorivermod/account/model/user_model.dart';
import 'package:demorivermod/order_detail/model/order_detail_model.dart';
import 'package:demorivermod/product_detail/model/product_detail_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';

class UserService{
  UserService._();
  static final instance = UserService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_USER;

  Future<UserModel> getUser(String id) async {
    try{
      final response = await Dio().get('$url?id=$id');

      if (response.statusCode == 200) {
        final mapResponse = jsonDecode(response.data)['data'][0];

        return UserModel.fromJson(mapResponse);
      }else{
        throw Exception('Failed to load product details');
      }
    } catch (error){
      throw Exception('Failed to connect to the server');
    }
  }
}
