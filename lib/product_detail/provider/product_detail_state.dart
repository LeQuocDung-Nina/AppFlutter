import '../model/product_detail_model.dart';

class ProductDetailState {
  final List<dynamic>? listProductDetails;
  final bool isLoading;

  ProductDetailState({this.listProductDetails, this.isLoading = true});

  ProductDetailState copyWith(
      {List<ProductDetailModel>? listProductDetails, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        listProductDetails: listProductDetails ?? this.listProductDetails);
  }
}




