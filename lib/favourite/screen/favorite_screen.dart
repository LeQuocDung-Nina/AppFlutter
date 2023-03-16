import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../home/provider/home_provider.dart';
import '../../home/widget/appbarhome.dart';
import '../../home/widget/product_home_item.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: _AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: _Product(),
        ),
      ),
    );
  }
}
class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AppBarHome();
  }
}


class _Product extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return (products.listFavorites != null && products.listFavorites!.isNotEmpty)
        ? ValueListenableBuilder(
      valueListenable: Hive.box('favorites_v5').listenable(),
      builder: (BuildContext context, box, Widget? child) {
        return AlignedGridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: 6,
          itemCount: products.listFavorites!.length.ceil(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          itemBuilder: (context, index) =>  ProductItem(product: products.listFavorites![index]),
        );
      },
    )
        :const Center(child: CircularProgressIndicator());
  }
}
