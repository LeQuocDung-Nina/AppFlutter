
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../color.dart';
import '../pay/pay_screen.dart';
import 'provider/cart_provider.dart';
import 'widget/cart_item.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);


  @override
  ConsumerState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late final Box cartBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartBox = ref.watch(CartProvider);
    print('carts: ${cartBox.listCarts}');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giỏ hàng",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19,color: color_lqd8),),
      ),
      body: SingleChildScrollView(
        child: (cartBox.listCarts != null && cartBox.listCarts!.isNotEmpty)
          ? ValueListenableBuilder(
        valueListenable: Hive.box('person_listCart').listenable(),
        builder: (BuildContext context, box, Widget? child) {
          return AlignedGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartBox.listCarts!.length.ceil(),
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemBuilder: (context, index) =>  CartItem(cart: cartBox.listCarts![index]),
          );
        },
      )
          : const CircularProgressIndicator(),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        height: 110,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GFCheckbox(
                  size: 28,
                  activeBgColor: GFColors.DANGER,
                  // type: GFCheckboxType.square,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value;
                    });
                  },
                  value: isChecked,
                  inactiveIcon: null,
                ),
                Text("Tất cả",style: TextStyle(color: color_lqd11,fontSize: 15,fontWeight: FontWeight.w400),)
              ],
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Tạm tính: ",
                    style: TextStyle(color: color_lqd1,fontWeight: FontWeight.w700,fontSize: 16),
                    children: [
                      TextSpan(text: "290000"),
                      TextSpan(text: "đ"),
                    ]),
                ),
                RichText(
                  text: const TextSpan(
                      text: "(",
                      style: TextStyle(color: color_lqd12,fontSize: 13),
                      children: [
                        TextSpan(text: "1 "),
                        TextSpan(text: "Sản phẩm)"),
                      ]),
                ),
              ],
            ),),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: color_lqd1,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PayScreen(),)),
                child: Text("Đặt hàng",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),),
            ),
          ],
        ),
      ),
    );
  }
}
