// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderListModel _$$_OrderListModelFromJson(Map<String, dynamic> json) =>
    _$_OrderListModel(
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
    );

Map<String, dynamic> _$$_OrderListModelToJson(_$_OrderListModel instance) =>
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
    };
