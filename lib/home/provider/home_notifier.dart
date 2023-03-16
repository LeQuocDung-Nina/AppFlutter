import 'package:demorivermod/home/adapter/item_favorites_hive.dart';
import 'package:demorivermod/home/model/slideshow_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/home_model.dart';
import '../repository/home_repository.dart';
import 'home_state.dart';

class ProductControler extends StateNotifier<ProductState> {
  ProductControler() : super(ProductState()) {
    _init();
    _initProductFav();
  }
  late final _boxFav;
  _init() async {
    final List<ProductModel>? a = await ProductService.instance.getProducts();
    state = state.copyWith(listProducts: a);

  }

  _initProductFav() async{
    state.copyWith(isLoading: true);
    _boxFav = Hive.box('favorites_v5');

    final listFavorites = _boxFav.toMap();

    List<ProductModel>? listTemp = [];
    if (listFavorites.length > 0) {
      listFavorites.forEach((key, value) {
        final itemFav = value as ItemFavHive;

        listTemp.add(ProductModel(
            id: itemFav.id,
            namevi: itemFav.namevi,
            regular_price: itemFav.regular_price,
            sale_price: itemFav.sale_price,
            photo: itemFav.photo,
            discount: itemFav.discount,
            id_list: itemFav.id_list,
            descvi: itemFav.descvi,
            isFav: itemFav.isFav,
        ));
      });
    }
    state = state.copyWith(isLoading: false, listFavorites: listTemp);
  }


  saveProductFav({required ProductModel productModel}) async{
    state.copyWith(isLoading: true);
    int index = state.listFavorites!.indexWhere((element) => element.id == productModel.id);
    if(index > -1){
      state.listFavorites!.removeAt(index);
    }else{
      state.listFavorites!.add(productModel);
    }
    updateFav();
    state.copyWith(isLoading: false);
  }


  updateFav() async {
    await _boxFav.clear();
    if(state.listFavorites!.isNotEmpty){
      for(var element in state.listFavorites!){
        ItemFavHive itemFavHive = ItemFavHive(
            id: element.id,
            namevi: element.namevi,
            regular_price: element.regular_price,
            sale_price: element.sale_price,
            photo: element.photo,
            discount: element.discount,
            id_list: element.id_list,
            descvi: element.descvi,
            isFav: element.isFav,
        );
        _boxFav.add(itemFavHive);
      }
    }
  }
}


class SlideshowControler extends StateNotifier<SlideshowState> {
  SlideshowControler() : super(SlideshowState()) {
    _initSlideshow();
  }
  _initSlideshow() async {
    state = state.copyWith(isLoading: true);
    final List<SlideshowModel>? listSlideshowNew = await SlideshowService.instance.getSlideshows();
    state = state.copyWith(isLoading: false, listSlideshows: listSlideshowNew);
  }
}