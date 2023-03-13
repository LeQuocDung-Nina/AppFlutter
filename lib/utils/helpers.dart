import 'dart:convert';

import 'package:hive/hive.dart';

import '../cart/provider/cart_state.dart';
import '../product_detail/adapter/Item_cart_hive.dart';


class Helpers{
  static Future<bool> updateFav({required String id, required Box boxFav})  async {
    var strFav = boxFav.get('list_product_fav') ?? '';
    List<String> list = strFav!=null ? strFav.split(',') : [];
    if(list.isNotEmpty){
      var flag = true;
      for(var i=0; i<list.length; i++){
        if(list[i]==id){
          flag = false;
          list.removeAt(i);
        }
      }
      if(flag==true) list.add(id);
    }else{
      list.add(id);
    }
    await boxFav.delete('list_product_fav');
    await boxFav.put('list_product_fav',list.join(','));

    return checkIsFav(id: id, listFav: list);
  }

  static checkIsFav({required String id, required List<String> listFav}){
    final index = listFav.indexWhere((element) => element == id);
    if(index>0){
      return true;
    }
    return false;
  }





  // static void updateCart({required String id,
  //   required String namevi,required String regular_price,
  //   required String quantity,required String photo, required Box boxCart}) async {
  //   // boxCart = Hive.box('person_listCart');
  //   Person_cart newPerson_cart = Person_cart(id: id, namevi: namevi, regular_price: regular_price, quantity: quantity, photo: photo);
  //   boxCart.add(newPerson_cart);
  // }
}