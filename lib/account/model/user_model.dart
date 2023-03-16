import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';
@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String avatar,
    required String username,
    required String password,
    required String fullname,
    required String phone,
    required String email,
    required String address,
    required String birthday,


  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json)
  => _$UserModelFromJson(json);
}

