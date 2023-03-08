
import 'package:demorivermod/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

import '../../color.dart';
import '../provider/cart_provider.dart';


class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.cart}) : super(key: key);
  final CartModel cart;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CheckBoxCart(widget.cart),

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
              child: _BuildBtnDec(widget.cart),
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
              child: _BuildBtnInc(widget.cart),
            ),
          ],
        ),
      ],
    );
  }
}


class _BuildBtnDec extends ConsumerWidget {
  const _BuildBtnDec(
      this.product, {
        Key? key,
      }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          ref.read(cartProvider.notifier).decreaseCart(item: product);
        },
        child: const Icon(
          Icons.remove,
          color: color_lqd10,
          size: 22,
        ));
  }
}

class _BuildBtnInc extends ConsumerWidget {
  const _BuildBtnInc(
      this.product, {
        Key? key,
      }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          ref.read(cartProvider.notifier).increaseCart(item: product);
        },
        child: const Icon(
          Icons.add,
          color: color_lqd10,
          size: 22,
        ));
  }
}

class _CheckBoxCart extends ConsumerWidget {
  const _CheckBoxCart(
      this.product, {
        Key? key,
      }) : super(key: key);

  final CartModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateCart =  ref.watch(cartProvider);
    return GFCheckbox(
      size: 28,
      activeBgColor: GFColors.DANGER,
      type: GFCheckboxType.square,
      onChanged: (value) {
        // setState(() {
        //   isChecked = value;
        // });
        ref.read(cartProvider.notifier).listCheckCart(id: product.id);
      },
      value: (stateCart.selectItems!=null) ? (stateCart.selectItems!.contains(product.id) ? true : false) : false,
      inactiveIcon: null,
    );
  }
}
