// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PropertyAdapter extends TypeAdapter<Property> {
  @override
  final int typeId = 0;

  @override
  Property read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Property(
      propertyName: fields[0] as String,
      address: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as int,
      size: fields[4] as String,
      status: fields[5] as String,
      propertyId: fields[6] as String,
      rentee: fields[7] as Rentee,
      index: fields[8] as int,
      fieldStatus: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Property obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.propertyName)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.size)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.propertyId)
      ..writeByte(7)
      ..write(obj.rentee)
      ..writeByte(8)
      ..write(obj.index)
      ..writeByte(9)
      ..write(obj.fieldStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
