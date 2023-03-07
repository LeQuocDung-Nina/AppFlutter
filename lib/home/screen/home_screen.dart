

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../model/home_model.dart';
import '../provider/home_provider.dart';
import '../widget/appbarhome.dart';
import '../widget/product_home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _AppBar(),
      ),
      body: SingleChildScrollView(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
          child: _Product())),
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
    print('products: ${products.listProducts}');

    return (products.listProducts != null && products.listProducts!.isNotEmpty)
        ? ValueListenableBuilder(
          valueListenable: Hive.box('favorites').listenable(),
          builder: (BuildContext context, box, Widget? child) {

            return AlignedGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // itemCount: 6,
                itemCount: products.listProducts!.length.ceil(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemBuilder: (context, index) =>  ProductItem(product: products.listProducts![index]),
            );
          },
          )
        : const CircularProgressIndicator();
  }
}



