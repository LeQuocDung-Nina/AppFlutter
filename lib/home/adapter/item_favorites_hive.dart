import 'package:hive/hive.dart';

part 'item_favorites_hive.g.dart';

@HiveType(typeId: 1)
class ItemFavHive {
  ItemFavHive({
    required this.id,
    required this.namevi,
    required this.descvi,
    required this.regular_price,
    required this.sale_price,
    required this.discount,
    required this.id_list,
    required this.photo,
    this.isFav = false,
  });

  @HiveField(0)
   String id;

  @HiveField(1)
   String namevi;

  @HiveField(2)
   String descvi;

  @HiveField(3)
   String regular_price;

  @HiveField(4)
   String sale_price;

  @HiveField(5)
   String discount;

  @HiveField(6)
   String id_list;

  @HiveField(7)
   String photo;

  @HiveField(8)
   bool? isFav;

}
