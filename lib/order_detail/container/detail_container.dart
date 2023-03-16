import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartContainer extends StateNotifier<int>{
  CartContainer() :  super(0);


  void addQuantity(){
    state = state+1;
  }
  void removeQuantity(){
    if(state>0){
      state = state-1;
    }
  }
}