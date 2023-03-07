import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';
@freezed
class CartModel with _$CartModel {
   factory CartModel({
    required String id,
    required String regularPrice,
    required String photo,
    required String namevi,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, Object?> json)
  => _$CartModelFromJson(json);
}

