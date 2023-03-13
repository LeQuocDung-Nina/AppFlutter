import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';
@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String id,
    required String namevi,
    required String descvi,
    required String regular_price,
    required String sale_price,
    required String discount,
    required String photo,
    required String id_list,
    @Default(false) isFav,

  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, Object?> json)
  => _$ProductModelFromJson(json);
}

