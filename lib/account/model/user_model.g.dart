// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as String,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      birthday: json['birthday'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'username': instance.username,
      'password': instance.password,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'birthday': instance.birthday,
    };
