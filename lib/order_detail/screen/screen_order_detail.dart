
import 'package:demorivermod/color.dart';
import 'package:demorivermod/order_detail/model/order_detail_model.dart';
import 'package:demorivermod/order_detail/provider/order_detail_provider.dart';
import 'package:demorivermod/order_detail/screen/screen_pdfreviewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widget/product_order_item_widget.dart';

class OrderDetail extends ConsumerStatefulWidget {
  const OrderDetail({Key? key, required this.idOrder}) : super(key: key);
  final String idOrder;


  @override
  ConsumerState createState() => _OrderDetailState();
}

class _OrderDetailState extends ConsumerState<OrderDetail> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    final order =  ref.watch(orderDetailProvider(widget.idOrder));
    final orderDetail = order.listOrderDetails?.first;
    final StyleText = TextStyle(fontSize: 16);

    // TextEditingController _controller = new TextEditingController();
    // _controller.text = (orderDetail != null)? orderDetail!.requirements : "";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chi tiết đơn hàng"),
      ),
      body:(order.listOrderDetails?.first != null) ? Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mã đơn hàng: ${orderDetail!.code}",style: StyleText,),
                SizedBox(height: 15,),
                Text("Họ tên: ${orderDetail.fullname}",style: StyleText,),
                SizedBox(height: 15,),
                Text("Điện thoại: ${orderDetail.phone},style: StyleText,"),
                SizedBox(height: 15,),
                Text("Email: ${orderDetail.email}",style: StyleText,),
                SizedBox(height: 15,),
                Text("Địa chỉ: ${orderDetail.address}",style: StyleText,),
                const SizedBox(height: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Yêu cầu khác",style: StyleText),
                    const SizedBox(height: 10,),
                    Text(orderDetail.requirements),
                    // TextField(
                    //   textAlignVertical: TextAlignVertical.top,
                    //   maxLines: 8,
                    //   minLines: 8,
                    //   controller: _controller,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(10),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       hintText: 'Nhập cầu khác'),
                    // ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text("Chi tiết đơn hàng",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                const SizedBox(height: 10,),
                _ListProduct(orderDetailModel: orderDetail),
                const SizedBox(height: 20,),
                Align(alignment: Alignment.centerRight, child: Text("Tổng: ${orderDetail.total_price}đ",style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: color_lqd1))),
              ],
            ),
          )
      )
          : const Center(child: Text('Chưa có dữ liệu')),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color_lqd1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PdfPreviewPage(orderDetailModel: orderDetail!),
              ),
            );

          },
          child: const Text("In hóa đơn",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
        )
      ),
    );
  }
}


class _ListProduct extends ConsumerWidget {
  const _ListProduct({required this.orderDetailModel,
    Key? key,
  }) : super(key: key);

  final OrderDetailModel orderDetailModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productItem = orderDetailModel?.product;
    return (productItem != null)
        ? AlignedGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productItem!.length,
      crossAxisCount: 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 20,
      itemBuilder: (context, index) =>  ProductOrderItem(productOrderModel: productItem![index]),
    )
        : const CircularProgressIndicator();
  }
}

