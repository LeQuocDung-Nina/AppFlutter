import 'package:hive/hive.dart';

part 'user_hive.g.dart';

@HiveType(typeId: 2)
class UserHive {
  UserHive({required this.id,
    required this.username,
    required this.password,
    required this.avatar,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.address,
    required this.birthday,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  @HiveField(3)
  String avatar;

  @HiveField(4)
  String fullname;

  @HiveField(5)
  String phone;

  @HiveField(6)
  String email;

  @HiveField(7)
  String address;

  @HiveField(8)
  String birthday;

}
