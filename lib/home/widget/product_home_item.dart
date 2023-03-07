import 'package:demorivermod/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../color.dart';
import '../../product_detail/product_detail.dart';
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
  final Box boxFav = Hive.box('favorites');
  bool isFav = false;

  late String id = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav = Helpers.checkIsFav(id: widget.product.id.toString(), listFav: (boxFav.get('list_product_fav') as String).split(','));
    id = widget.product.id.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/product-detail/$id');
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
                bool a = await Helpers.updateFav(id: widget.product.id.toString(), boxFav: boxFav);
                setState(() {
                  isFav = a;
                  if(isFav==true){
                    const snackBar = SnackBar(content: Text("Đã thích sản phẩm"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }else{
                    const snackBar = SnackBar(content: Text("Bỏ thích sản phẩm"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                });
              },
              icon: Icon(
                (isFav==true) ? Icons.favorite : Icons.favorite_border,
                color: color_lqd1,
              ),

              // icon: const Icon(Icons.favorite_border,color: color_lqd1,),
            ),
          ),
        ),

        RichText(text: TextSpan(
            style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: color_lqd1),
            children: [
              TextSpan(text: widget.product.regularPrice.toString()),
              const TextSpan(text: 'đ'),
            ]
        )
        )
      ],
    );
  }
}