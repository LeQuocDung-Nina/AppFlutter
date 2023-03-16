
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

import '../../cart/model/cart_model.dart';
import '../../cart/provider/cart_provider.dart';
import '../../color.dart';
import '../../home/model/home_model.dart';
import '../../home/provider/home_provider.dart';
import '../model/product_detail_model.dart';
import '../provider/product_detail_provider.dart';
import '../widget/appbar_detail.dart';

class ProductDetail extends ConsumerStatefulWidget {
  const ProductDetail({Key? key, required this.idProduct}) : super(key: key);
  final String idProduct;

  // final double _rating = 4;
  @override
  ConsumerState createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    final productDetailState = ref.watch(productDetailProvider(widget.idProduct));
    final product = productDetailState.listProductDetails?.first;
    final bool isFav = ref.read(productProvider).listFavorites?.any((fav) => fav.id == product?.id) ?? false;
    return Scaffold(
      appBar: AppBar(
        title: const AppbarProductDetail(),
      ),
      body: (product != null) ? SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.photo,width: double.maxFinite,fit: BoxFit.fill,),
            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    title: Text(product.namevi.toString(),style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 23,color: color_lqd8)),
                    trailing: IconButton(
                      onPressed: () async {
                        ref.read(productProvider.notifier).saveProductFav(
                            productModel: ProductModel(
                              id: product.id,
                              descvi: product.descvi,
                              discount: product.discount,
                              id_list: product.id_list,
                              namevi: product.namevi,
                              photo: product.photo,
                              regular_price: product.regular_price,
                              sale_price: product.sale_price,
                              isFav: product.isFav,
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
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text:  TextSpan(
                          text: product.regular_price ,
                          style: const TextStyle(color: color_lqd1,fontSize: 21,),
                          children: const <TextSpan>[
                            TextSpan(text: 'đ'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GFRating(
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            size: 20.0,
                            value: 4,
                            onChanged: (rating) {
                              rating = rating;
                            },
                          ),
                          const SizedBox(width: 10,),
                          RichText(
                            text:  const TextSpan(
                              text: "562",
                              style: TextStyle(color: color_lqd4,fontSize: 16,),
                              children:  <TextSpan>[
                                TextSpan(text: 'Reviews'),
                              ],
                            ),
                          ),
                        ],
                      )

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(product.descvi,style: const TextStyle(color: color_lqd6,fontSize: 18,fontWeight: FontWeight.w400,),),
                ],
              ),
            ),
            Container(
              height: 1,
              margin: const EdgeInsets.only(top: 20.0),
              color: color_lqd7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          margin:const  EdgeInsets.only(right: 10),
                          child: const Text("Màu sắc",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: color_lqd8),)
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.deepOrange,width: 2,strokeAlign: 5),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin:const EdgeInsets.symmetric(horizontal: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.tealAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 55,
                        decoration: BoxDecoration(
                          color:color_lqd9,borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.shopping_cart_sharp,color: color_lqd1),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        flex: 2,
                        child: _BuildAddCartWidget(product!),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      : const Center(child: Text('Chưa có dữ liệu'))
    );
  }


}

class _BuildAddCartWidget extends ConsumerWidget {
  const _BuildAddCartWidget(this.product, {
    Key? key,
  }) : super(key: key);

  final ProductDetailModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: (){
        ref.read(cartProvider.notifier).addCart(
            item: CartModel(
                id: product.id,
                namevi: product.namevi,
                regular_price: product.regular_price,
                photo: product.photo,
                quantity: '1'));
        // context.push(AppRouter.cartScreen);
      },
      style: ElevatedButton.styleFrom(backgroundColor: color_lqd1,minimumSize: const Size(100, 55)),
      child: const Center(
        child: Text("Mua ngay",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),),
      ),
    );
  }
}








