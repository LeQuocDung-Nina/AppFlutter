import '../model/product_detail_model.dart';

class ProductDetailState {
  final List<dynamic>? listProducts;
  final bool isLoading;

  ProductDetailState({this.listProducts, this.isLoading = true});

  ProductDetailState copyWith(
      {List<ProductDetailModel>? listProducts, bool? isLoading}) {
    return ProductDetailState(
        isLoading: isLoading ?? this.isLoading,
        listProducts: listProducts ?? this.listProducts);
  }
}




