
import 'package:demorivermod/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive/hive.dart';


import '../cart/model/cart_model.dart';
import '../color.dart';
import '../router.dart';
import 'container/detail_container.dart';
import 'model/product_detail_model.dart';
import 'repository/product_detail_repository.dart';
import 'widget/appbar_detail.dart';

class ProductDetail extends ConsumerStatefulWidget {

  const ProductDetail({Key? key, required this.idProduct}) : super(key: key);

  final String idProduct;



  // final double _rating = 4;
  @override
  ConsumerState createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {

  late final Box box;

  late final Future<ProductDetailModel> productDetail;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetail = ProductDetailService.instance.getProductDetail(int.parse(widget.idProduct));
  }

  // final quantityProvider = StateNotifierProvider<CartContainer,int>((ref)=>CartContainer());

  @override
  Widget build(BuildContext context) {

    // final counter = ref.watch(quantityProvider);
    // final quantity = counter + 1;

    // final Box boxCart = Hive.box('box_listCart');

    return Scaffold(
      appBar: AppBar(
        title: const AppbarProductDetail(),
      ),
      body: FutureBuilder(
        future: productDetail,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            final product = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(product?.photo ?? '',width: double.maxFinite,fit: BoxFit.fill,),
                  const SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Text(product?.namevi??'',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 23,color: color_lqd8),)),
                            const Expanded(
                                flex: 1,
                                child: Icon(Icons.favorite_border,color: color_lqd1,))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text:  TextSpan(
                                text: product?.regularPrice ?? '',
                                style: TextStyle(color: color_lqd1,fontSize: 21,),
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
                        Text(product?.descvi ?? '',style: TextStyle(color: color_lqd6,fontSize: 18,fontWeight: FontWeight.w400,),),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.only(top: 20.0),
                    color: color_lqd7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text("Màu sắc",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: color_lqd8),)
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
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
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
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

                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 55,
                              decoration: BoxDecoration(
                                color:color_lqd9,borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(Icons.shopping_cart_sharp,color: color_lqd1),
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
            );
          }
          else {
            return Text("Đang tải lên");
          }
        },
      ),
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
                id: product?.id ?? '',
                namevi: product?.namevi ?? '',
                regular_price: product?.regularPrice ?? '',
                photo: product?.photo ?? '',
                quantity: '1' ?? ''));
        // context.push(AppRouter.cartScreen);
      },
      style: ElevatedButton.styleFrom(primary: color_lqd1,minimumSize: const Size(100, 55)),
      child: const Center(
        child: Text("Mua ngay",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 17),),
      ),
    );
  }
}








