// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rentee.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RenteeAdapter extends TypeAdapter<Rentee> {
  @override
  final int typeId = 1;

  @override
  Rentee read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Rentee(
      name: fields[0] as String,
      contact: fields[1] as String,
      email: fields[2] as String,
      businessdetail: fields[3] as String,
      citizenimage: fields[4] as String,
      agreementimage: fields[5] as String,
      renteeId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rentee obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.contact)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.businessdetail)
      ..writeByte(4)
      ..write(obj.citizenimage)
      ..writeByte(5)
      ..write(obj.agreementimage)
      ..writeByte(6)
      ..write(obj.renteeId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RenteeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
