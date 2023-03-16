import 'package:demorivermod/home/model/home_model.dart';
import 'package:demorivermod/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hive/hive.dart';
import '../../color.dart';
import '../../utils/helpers.dart';



class ProductItem extends ConsumerStatefulWidget {
  const ProductItem( {
  Key? key,
    required this.product
  }) : super(key: key);

  final ProductModel product;

  @override
  ConsumerState createState() => _ProductItemState();
}

class _ProductItemState extends ConsumerState<ProductItem> {
  final Box boxFav = Hive.box('favorites_v5');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final bool isFav = ref.read(productProvider).listFavorites?.any((fav) => fav.id == widget.product.id) ?? false;


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              // GoRouter.of(context).push('/product-detail/${widget.product.id}');
              context.push('/product-detail/${widget.product.id}');
            },
            child: Image.network(widget.product.photo.toString(),width: double.maxFinite,height: 210,fit: BoxFit.fill,)
        ),
        const SizedBox(height: 10,),
        Container(
          margin:const  EdgeInsets.only(bottom: 5),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            title: Text(widget.product.namevi.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: color_lqd5)),
            trailing: IconButton(
              onPressed: () async {
                ref.read(productProvider.notifier).saveProductFav(
                    productModel: ProductModel(
                      id: widget.product.id,
                      descvi: widget.product.descvi,
                      discount: widget.product.discount,
                      id_list: widget.product.id_list,
                      namevi: widget.product.namevi,
                      photo: widget.product.photo,
                      regular_price: widget.product.regular_price,
                      sale_price: widget.product.sale_price,
                      isFav: widget.product.isFav,
                    ));

                setState(() {
                  if(isFav){
                    const snackBar = SnackBar(content: Text("Bỏ thích sản phẩm"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{

                    const snackBar = SnackBar(content: Text("Đã thích sản phẩm"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
              icon: Icon(
                (isFav) ? Icons.favorite : Icons.favorite_border,
                color: color_lqd1,
              ),

              // icon: const Icon(Icons.favorite_border,color: color_lqd1,),
            ),
          ),
        ),

        RichText(text: TextSpan(
            style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: color_lqd1),
            children: [
              TextSpan(text: widget.product.regular_price.toString()),
              const TextSpan(text: 'đ'),
            ]
        )
        )
      ],
    );
  }
}