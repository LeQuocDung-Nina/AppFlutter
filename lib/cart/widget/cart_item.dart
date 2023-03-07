
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../color.dart';
import '../../product_detail/adapter/Item_cart_hive.dart';

bool isChecked = true;
class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.cart}) : super(key: key);
  final ItemCartHive cart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(width: 10,),
        Expanded(
            child: Image.network(widget.cart.photo,height: 90,width: double.maxFinite,fit: BoxFit.contain,)),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.cart.namevi.toString(),style: const TextStyle(color: color_lqd5,fontSize: 15,fontWeight: FontWeight.w400),),
              const SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: color_lqd1,fontSize: 17,fontWeight: FontWeight.w400),
                  text: widget.cart.regular_price.toString(),
                  children: const <TextSpan>[
                    TextSpan(text: 'đ'),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
        // const Spacer(),
        Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: color_lqd10),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Text("-",style: TextStyle(color: color_lqd10,),)),
            ),

            Container(
              width: 28,
              height: 28,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: color_lqd10),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text(widget.cart.quantity.toString())),
            ),

            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: color_lqd10),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: Text("+",style: TextStyle(color: color_lqd10,),)),
            ),
          ],
        ),
      ],
    );
  }
}
