import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_notifier.dart';
import 'home_state.dart';



final productProvider = StateNotifierProvider<ProductControler, ProductState>(
      (ref) => ProductControler(),
);

final slideshowProvider = StateNotifierProvider<SlideshowControler, SlideshowState>(
      (ref) => SlideshowControler(),
);