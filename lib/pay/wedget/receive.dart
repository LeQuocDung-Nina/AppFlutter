import 'package:flutter/material.dart';

import '../../color.dart';

class Receive extends StatelessWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(flex: 5, child: Text("Thông tin nhận hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd11),)),
            Expanded(flex: 3, child: ElevatedButton(
              onPressed: () {
            },
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.white,
                  elevation: 1,
                  primary: Colors.white,
                  // onPrimary: priceColor,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: color_lqd11))),
              child: Text("Thêm địa chỉ mới",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: color_lqd11),),),),
          ],
        ),
        SizedBox(height: 10,),
        const Text("Bạn chưa có địa chỉ nhận hàng bấm thêm địa chỉ mới"),
      ],
    );
  }
}
