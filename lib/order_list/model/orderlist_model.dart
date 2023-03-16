import 'package:freezed_annotation/freezed_annotation.dart';

part 'orderlist_model.freezed.dart';
part 'orderlist_model.g.dart';
@freezed
class OrderListModel with _$OrderListModel {
  factory OrderListModel({
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

  }) = _OrderListModel;

  factory OrderListModel.fromJson(Map<String, Object?> json)
  => _$OrderListModelFromJson(json);
}
