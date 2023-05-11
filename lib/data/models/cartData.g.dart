// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartDataAdapter extends TypeAdapter<CartData> {
  @override
  final int typeId = 1;

  @override
  CartData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartData(
      count: fields[9] as int,
      key: fields[8] as int,
      id: fields[0] as int,
      rating: fields[1] as double,
      brand: fields[2] as String,
      name: fields[3] as String,
      price: fields[4] as String,
      image_link: fields[5] as String,
      description: fields[6] as String,
      product_type: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CartData obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.rating)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.image_link)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.product_type)
      ..writeByte(8)
      ..write(obj.key)
      ..writeByte(9)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
