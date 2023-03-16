import 'package:hive/hive.dart';

part 'Item_cart_hive.g.dart';

@HiveType(typeId: 0)
class ItemCartHive {
  ItemCartHive({required this.id, required this.namevi, required this.regular_price, required this.quantity, required this.photo});

  @HiveField(0)
  String id;

  @HiveField(1)
  String namevi;

  @HiveField(2)
  String regular_price;

  @HiveField(3)
  String quantity;

  @HiveField(4)
  String photo;

}
