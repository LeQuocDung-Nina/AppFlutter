import 'package:demorivermod/product_detail/provider/product_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../home/adapter/item_favorites_hive.dart';
import '../model/product_detail_model.dart';
import '../repository/product_detail_repository.dart';


class ProductDetailController extends StateNotifier<ProductDetailState> {
  final String idProduct;

  ProductDetailController(this.idProduct) : super(ProductDetailState()) {
    _init();
    _initProductFav();
  }
  late final _boxFav;

  void _init() async {
    final ProductDetailModel productDetail = await ProductDetailService.instance.getProductDetail(idProduct);
    state = state.copyWith(listProductDetails: [productDetail]);
  }

  _initProductFav() async{
    state.copyWith(isLoading: true);
    _boxFav = Hive.box('favorites_v5');
    final listFavorites = _boxFav.toMap();

    List<ProductDetailModel>? listTemp = [];
    if (listFavorites.length > 0) {
      listFavorites.forEach((key, value) {
        final itemFav = value as ItemFavHive;

        listTemp.add(ProductDetailModel(
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
    state = state.copyWith(isLoading: false, listFav:listTemp);
  }

}

