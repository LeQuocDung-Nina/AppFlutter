
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
    Future.delayed(const Duration(milliseconds: 1),(){
      ref.read(cartProvider.notifier).checkAll(isChecked: false);
    });
  }


  @override
  Widget build(BuildContext context) {
    final stateCart = ref.watch(cartProvider);
    final totalItem = ref.read(cartProvider.notifier).totalItemsCart();

    // int totalItem = 0;
    // Future.delayed(const Duration(milliseconds: 2),(){
    //   totalItem = ref.read(cartProvider.notifier).totalItemsCart();
    // });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Giỏ hàng",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19,color: color_lqd8),),
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(child: _BuildListCart(),)
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
                Consumer(
                  builder: (context, ref, child) {
                    final stateCart = ref.watch(cartProvider);
                    final bool isChecked = (stateCart.selectItems!=null && stateCart.selectItems?.length==stateCart.listCarts?.length);
                    return GFCheckbox(
                      size: 28,
                      activeBgColor: GFColors.DANGER,
                      // type: GFCheckboxType.square,
                      onChanged: (value) {
                        ref.read(cartProvider.notifier).checkAll(isChecked: isChecked);
                      },
                      value: isChecked,
                      inactiveIcon: null,
                    );
                  },
                ),
                Text("Tất cả",style: TextStyle(color: color_lqd11,fontSize: 15,fontWeight: FontWeight.w400),)
              ],
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Tạm tính: ",
                    style: TextStyle(color: color_lqd1,fontWeight: FontWeight.w700,fontSize: 16),
                    children: [
                      TextSpan(text: stateCart.totalPrice.toString()),
                      TextSpan(text: "đ"),
                    ]),
                ),
                RichText(
                  text:  TextSpan(
                      text: "(",
                      style: TextStyle(color: color_lqd12,fontSize: 13),
                      children: [
                        TextSpan(text: '${totalItem.toString()}'),
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


class _BuildListCart extends ConsumerWidget {
  const _BuildListCart({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartBox = ref.watch(cartProvider);
    final listCarts = cartBox.listCarts!;

    return listCarts.length > 0
        ? ListView.separated(
          shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          itemCount: listCarts.length,
          separatorBuilder: (context, index) => const Divider(height: 30),
          itemBuilder: (context, index) {
            final itemCartModel = listCarts[index];
            return CartItem(cart: itemCartModel);
          },
        )
        : const Center(
      child: Text('Chưa có sản phẩm nào trong giỏ hàng'),
    );
  }
}
