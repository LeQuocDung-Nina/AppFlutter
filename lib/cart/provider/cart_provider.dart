

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_notifier.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartControler, CartState>(
      (ref) => CartControler (),
);