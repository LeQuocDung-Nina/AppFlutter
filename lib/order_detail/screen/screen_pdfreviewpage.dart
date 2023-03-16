import 'package:demorivermod/order_detail/model/order_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'screen_makepdf.dart';

class PdfPreviewPage extends ConsumerWidget {
  const PdfPreviewPage ({required this.orderDetailModel,
    Key? key,
  }) : super(key: key);

  final OrderDetailModel orderDetailModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chi tiết Đơn hàng"),
      ),
      body: PdfPreview(
        build: (context) => makePdf(orderDetailModel),
      ),
    );
  }
}
