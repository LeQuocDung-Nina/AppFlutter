// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_favorites_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemFavHiveAdapter extends TypeAdapter<ItemFavHive> {
  @override
  final int typeId = 1;

  @override
  ItemFavHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemFavHive(
      id: fields[0] as String,
      namevi: fields[1] as String,
      descvi: fields[2] as String,
      regular_price: fields[3] as String,
      sale_price: fields[4] as String,
      discount: fields[5] as String,
      id_list: fields[6] as String,
      photo: fields[7] as String,
      isFav: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemFavHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.namevi)
      ..writeByte(2)
      ..write(obj.descvi)
      ..writeByte(3)
      ..write(obj.regular_price)
      ..writeByte(4)
      ..write(obj.sale_price)
      ..writeByte(5)
      ..write(obj.discount)
      ..writeByte(6)
      ..write(obj.id_list)
      ..writeByte(7)
      ..write(obj.photo)
      ..writeByte(8)
      ..write(obj.isFav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemFavHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
