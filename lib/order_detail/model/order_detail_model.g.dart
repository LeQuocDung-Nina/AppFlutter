// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetailModel _$$_OrderDetailModelFromJson(Map<String, dynamic> json) =>
    _$_OrderDetailModel(
      id: json['id'] as String,
      code: json['code'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      temp_price: json['temp_price'] as String,
      total_price: json['total_price'] as String,
      ship_price: json['ship_price'] as String,
      requirements: json['requirements'] as String,
      product: (json['product'] as List<dynamic>)
          .map((e) => ProductOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderDetailModelToJson(_$_OrderDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'address': instance.address,
      'email': instance.email,
      'temp_price': instance.temp_price,
      'total_price': instance.total_price,
      'ship_price': instance.ship_price,
      'requirements': instance.requirements,
      'product': instance.product,
    };
