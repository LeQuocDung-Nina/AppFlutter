import 'dart:convert';

import 'package:hive/hive.dart';

class Helpers{
  static Future<bool> updateFav({required String id, required Box boxFav})  async {
    var strFav = boxFav.get('list_product_fav');
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
}