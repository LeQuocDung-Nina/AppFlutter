// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['id'] as String,
      namevi: json['namevi'] as String,
      descvi: json['descvi'] as String,
      regular_price: json['regular_price'] as String,
      sale_price: json['sale_price'] as String,
      discount: json['discount'] as String,
      photo: json['photo'] as String,
      id_list: json['id_list'] as String,
      isFav: json['isFav'] ?? false,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namevi': instance.namevi,
      'descvi': instance.descvi,
      'regular_price': instance.regular_price,
      'sale_price': instance.sale_price,
      'discount': instance.discount,
      'photo': instance.photo,
      'id_list': instance.id_list,
      'isFav': instance.isFav,
    };
