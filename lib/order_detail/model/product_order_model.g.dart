// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductOrderModel _$$_ProductOrderModelFromJson(Map<String, dynamic> json) =>
    _$_ProductOrderModel(
      id: json['id'] as String,
      id_order: json['id_order'] as String,
      id_product: json['id_product'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      quantity: json['quantity'] as String,
      regular_price: json['regular_price'] as String,
      sale_price: json['sale_price'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$$_ProductOrderModelToJson(
        _$_ProductOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_order': instance.id_order,
      'id_product': instance.id_product,
      'name': instance.name,
      'code': instance.code,
      'quantity': instance.quantity,
      'regular_price': instance.regular_price,
      'sale_price': instance.sale_price,
      'photo': instance.photo,
    };
