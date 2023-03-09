

import '../model/home_model.dart';
import '../model/slideshow_model.dart';

class ProductState {
  final List<ProductModel>? listProducts;
  final bool isLoading;

  ProductState({this.listProducts, this.isLoading = true});

  ProductState copyWith({List<ProductModel>? listProducts, bool? isLoading}) {
    return ProductState(
        isLoading: isLoading ?? this.isLoading,
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



