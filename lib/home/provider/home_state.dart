

import '../model/home_model.dart';
import '../model/slideshow_model.dart';

class ProductState {
  final List<ProductModel>? listProducts;
  final List<ProductModel>? listFavorites;
  final bool isLoading;

  ProductState({this.listProducts, List<ProductModel>? listFavorites, this.isLoading = true})
      : listFavorites = listFavorites ?? [];

  ProductState copyWith({List<ProductModel>? listProducts, List<ProductModel>? listFavorites, bool? isLoading}) {
    return ProductState(
        isLoading: isLoading ?? this.isLoading,
        listFavorites: listFavorites ?? this.listFavorites,
        listProducts: listProducts ?? this.listProducts);
  }
}


class SlideshowState {
  final List<SlideshowModel>? listSlideshows;
  final bool isLoading;

  SlideshowState({this.listSlideshows, this.isLoading = true});
  SlideshowState copyWith({List<SlideshowModel>? listSlideshows, bool? isLoading}) {
    return SlideshowState(
        isLoading: isLoading ?? this.isLoading,
        listSlideshows: listSlideshows ?? this.listSlideshows);
  }
}



