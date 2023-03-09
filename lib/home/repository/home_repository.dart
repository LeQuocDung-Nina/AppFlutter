import 'dart:convert';

import '../model/home_model.dart';
import 'package:dio/dio.dart';
import '../../api/api-constants.dart';
import '../model/slideshow_model.dart';


class ProductService{
  ProductService._();
  static final instance = ProductService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_RANDOM_3;

  Future<List<ProductModel>?> getProducts() async{
    List<ProductModel>? listProducts = [];
    final response = await Dio().get(url);
    if(response.statusCode==200){
      final mapResponse = jsonDecode(response.data)['data'];
      for(var product in mapResponse){
        listProducts.add(ProductModel.fromJson(product));
      }
    }
    return listProducts;
  }

}

class SlideshowService{
  SlideshowService._();
  static final instance = SlideshowService._();
  final url  = ApiConstants.BASE_URL + ApiConstants.PATH_SLIDESHOW;

  Future<List<SlideshowModel>?> getSlideshows() async{
    List<SlideshowModel>? listSlideshows = [];

    final response = await Dio().get(url);
    if(response.statusCode==200){
      final mapResponse = jsonDecode(response.data)['data'];

      for(var slideshow in mapResponse){
        listSlideshows.add(SlideshowModel.fromJson(slideshow));
      }
    }

    return listSlideshows;
  }

}
