import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_order_model.freezed.dart';
part 'product_order_model.g.dart';
@freezed
class ProductOrderModel with _$ProductOrderModel {
  factory ProductOrderModel({
    required String id,
    required String id_order,
    required String id_product,
    required String name,
    required String code,
    required String quantity,
    required String regular_price,
    required String sale_price,
    required String photo,

  }) = _ProductOrderModel;

  factory ProductOrderModel.fromJson(Map<String, Object?> json)
  => _$ProductOrderModelFromJson(json);

}



