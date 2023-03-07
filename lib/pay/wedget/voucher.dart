import 'package:flutter/material.dart';
import '../../color.dart';

class Voucher extends StatelessWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const [
        Expanded(child: Text("Voucher 10%",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: color_lqd11),)),
        Text("Chọn hoặc nhập mã >",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: color_lqd12),),
      ],
    );
  }
}
