import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counterdemo extends StateNotifier<int>{
  Counterdemo() :  super(0);
  void increment(){
    state++;
  }
  void reduce(){
    state--;
  }
}