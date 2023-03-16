

import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import '../model/order_detail_model.dart';


Future<Uint8List> makePdf(OrderDetailModel orderDetail) async {

  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/images/logoshop.png')).buffer.asUint8List());

  final theme = PageTheme(
    pageFormat: PdfPageFormat.a4,
    buildBackground: (Context context) {
      return Center(
        // ignoreMargins: false,
        child: Opacity(opacity: 0.8,child: Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),),
      );
    },
  );

  final font = await PdfGoogleFonts.nunitoExtraLight();
  final fontitalic = await PdfGoogleFonts.nunitoExtraLightItalic();
  final fontBold = await PdfGoogleFonts.nunitoExtraBold();
  final textStyle = TextStyle(font: font, fontSize: 14, fontWeight: FontWeight.normal);

  // Add content to PDF
  pdf.addPage(
    MultiPage(
      pageTheme: theme,
      build: (context) => [
        Partition(child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(child: Text("HÓA ĐƠN",style: TextStyle(font: fontBold, fontSize: 25,)),),
            // pw.Align(child: pw.Text("(Hóa đơn chuyển đổi từ hóa đơn điện tử)",style: pw.TextStyle(font: fontitalic, fontSize: 11,)),),
            Align(child: Text("Ngày 14 tháng 03 năm 2023",style: TextStyle(font: fontitalic, fontSize: 11,)),),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Mã đơn hàng: ${orderDetail!.id}",style: TextStyle(font: font)),
                        SizedBox(height: 10,),
                        Text("Họ tên: ${orderDetail.fullname}",style: TextStyle(font: font)),
                        SizedBox(height: 10,),
                        Text("Điện thoại: ${orderDetail.phone}",style: TextStyle(font: font)),
                        SizedBox(height: 10,),
                        Text("Email: ${orderDetail.email}",style: TextStyle(font: font)),
                        SizedBox(height: 10,),
                        Text("Địa chỉ: ${orderDetail.address}",style: TextStyle(font: font)),



                      ],
                    )
                ),
                Container(
                  width: 60,
                  height: 60,
                  child: BarcodeWidget(data: orderDetail.code, barcode: Barcode.qrCode(),),
                )

              ],
            ),
            SizedBox(height: 10,),
            Text("Yêu cầu khác: ${orderDetail.requirements}",style: TextStyle(font: font)),
            SizedBox(height: 10,),

            Text("Chi tiết đơn hàng",style: TextStyle(fontSize: 16,font: fontBold),),
            SizedBox(height: 10,),
            // _ListProduct(orderDetailModel: orderDetail),
            Table.fromTextArray(
              headerStyle: TextStyle(fontWeight: FontWeight.bold,font: font),
              cellAlignment: Alignment.centerLeft,
              headerDecoration: BoxDecoration(color: PdfColors.grey300),
              data: <List<String>>[
                <String>['Tên sản phẩm', 'Giá bán', 'Số lượng', 'Tổng giá'],
                for (var product in orderDetail.product!)
                  <String>[
                    product.name,
                    '${product.regular_price}đ',
                    '${product.quantity}',
                    '${int.parse(product.regular_price) * int.parse(product.quantity)} đ',
                  ]
              ],
              cellStyle: textStyle,
            ),



            SizedBox(height: 20,),
            Align(alignment: Alignment.centerRight, child: Text("Tổng: ${orderDetail.total_price}đ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: PdfColors.black,font: font))),
            SizedBox(height: 20,),
            Row(
                children: [
                  Expanded(
                    child: Column(
                        children: [
                          Text("Người mua hàng",style: TextStyle(font: fontBold,fontSize: 14)),
                          Text("(Ký và ghi rõ họ tên)",style: TextStyle(font: fontitalic,fontSize: 11)),
                        ]
                    ),
                  ),
                  Expanded(
                    child: Column(
                        children: [
                          Text("Người bán hàng",style: TextStyle(font: fontBold,fontSize: 14)),
                          Text("(Ký và ghi rõ họ tên)",style: TextStyle(font: fontitalic,fontSize: 11)),
                        ]
                    ),
                  )
                ]
            )
          ],
        ),),
      ],
    ),
  );
  return pdf.save();

  // // Get PDF as bytes
  // final bytes = await pdf.save();
  // // Print PDF
  // await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
}

