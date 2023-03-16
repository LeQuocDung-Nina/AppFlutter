// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetailModel _$$_ProductDetailModelFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDetailModel(
      id: json['id'] as String,
      namevi: json['namevi'] as String,
      descvi: json['descvi'] as String,
      photo: json['photo'] as String,
      regular_price: json['regular_price'] as String,
      sale_price: json['sale_price'] as String,
      discount: json['discount'] as String,
      id_list: json['id_list'] as String,
      isFav: json['isFav'] ?? false,
    );

Map<String, dynamic> _$$_ProductDetailModelToJson(
        _$_ProductDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namevi': instance.namevi,
      'descvi': instance.descvi,
      'photo': instance.photo,
      'regular_price': instance.regular_price,
      'sale_price': instance.sale_price,
      'discount': instance.discount,
      'id_list': instance.id_list,
      'isFav': instance.isFav,
    };
