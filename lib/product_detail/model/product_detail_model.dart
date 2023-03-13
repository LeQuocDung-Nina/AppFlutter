import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_model.freezed.dart';
part 'product_detail_model.g.dart';
@freezed
class ProductDetailModel with _$ProductDetailModel {
  factory ProductDetailModel({
    required String id,
    required String namevi,
    required String descvi,
    required String photo,
    required String regular_price,
    required String sale_price,
    required String discount,
    required String id_list,
  }) = _ProductDetailModel;

  factory ProductDetailModel.fromJson(Map<String, Object?> json)
  => _$ProductDetailModelFromJson(json);
}
