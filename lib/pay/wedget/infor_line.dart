import 'package:flutter/material.dart';
import '../../color.dart';

class InforLine extends StatelessWidget {
  const InforLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Thông tin đơn hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd11),),
        const SizedBox(height: 20,),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text("Tổng tiền hàng",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: color_lqd12),),
                RichText(text: const TextSpan(
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd1),
                    children: [
                      TextSpan(text: "580.000",),
                      TextSpan(text: "đ",),
                    ]
                )),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text("Phí giao hàng",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: color_lqd12),),
                RichText(text: const TextSpan(
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd12),
                    children: [
                      TextSpan(text: "0",),
                      TextSpan(text: "đ",),
                    ]
                )),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text("Khuyến mãi",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: color_lqd12),),
                RichText(text: const TextSpan(
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd12),
                    children: [
                      TextSpan(text: "-",),
                      TextSpan(text: "0",),
                      TextSpan(text: "đ",),
                    ]
                )),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ],
    );
  }
}
