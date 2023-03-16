import 'package:demorivermod/home/model/home_model.dart';

import '../model/product_detail_model.dart';

class ProductDetailState {
  final List<ProductDetailModel>? listProductDetails;
  final List<ProductDetailModel>? listFav;
  final bool isLoading;

  ProductDetailState({this.listProductDetails, List<ProductDetailModel>? listFav, this.isLoading = true})
      : listFav = listFav ?? [];

  ProductDetailState copyWith(
      {List<ProductDetailModel>? listProductDetails, List<ProductDetailModel>? listFav, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        listFav: listFav ?? this.listFav,
        listProductDetails: listProductDetails ?? this.listProductDetails
    );
  }
}




