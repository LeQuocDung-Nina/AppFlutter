// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Item_cart_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemCartHiveAdapter extends TypeAdapter<ItemCartHive> {
  @override
  final int typeId = 0;

  @override
  ItemCartHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemCartHive(
      id: fields[0] as String,
      namevi: fields[1] as String,
      regular_price: fields[2] as String,
      quantity: fields[3] as String,
      photo: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemCartHive obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.namevi)
      ..writeByte(2)
      ..write(obj.regular_price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemCartHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
