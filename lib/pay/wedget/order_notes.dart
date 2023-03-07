import 'package:flutter/material.dart';

import '../../color.dart';



class OrderNotes extends StatelessWidget {
  const OrderNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        const Text("Ghi chú đơn hàng",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: color_lqd11),),
        SizedBox(height: 20,),
        TextFormField(
          minLines: 4,
          maxLines: null,
          style: TextStyle(color: color_lqd11),
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            filled: true,
            fillColor: color_lqd13,
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            labelText: 'Bạn có vấn đề gì cần ghi chú vào đây',
            labelStyle: TextStyle(color: color_lqd12,fontSize: 13,),
          ),
        ),

      ],
    );
  }
}
