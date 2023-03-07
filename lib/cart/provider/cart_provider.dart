

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_notifier.dart';
import 'cart_state.dart';

final CartProvider = StateNotifierProvider<CartControler, CartState>(
      (ref) => CartControler (),
);