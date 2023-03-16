import 'package:demorivermod/order_detail/model/product_order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';
@freezed
class OrderDetailModel with _$OrderDetailModel {
  factory OrderDetailModel({
    required String id,
    required String code,
    required String fullname,
    required String phone,
    required String address,
    required String email,
    required String temp_price,
    required String total_price,
    required String ship_price,
    required String requirements,
    required List<ProductOrderModel> product,

  }) = _OrderDetailModel;

  factory OrderDetailModel.fromJson(Map<String, Object?> json)
  => _$OrderDetailModelFromJson(json);

}

