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
      renteeName: fields[0] as String,
      renteeContact: fields[1] as String,
      renteeEmail: fields[2] as String,
      businessdetail: fields[3] as String,
      citizenimage: fields[4] as String,
      agreementimage: fields[5] as String,
      renteeId: fields[6] as String,
      dueAmount: fields[7] as int,
      advanceAmount: fields[8] as int,
      renteePayment: fields[11] as Payment,
      renteePanNumber: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Rentee obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.renteeName)
      ..writeByte(1)
      ..write(obj.renteeContact)
      ..writeByte(2)
      ..write(obj.renteeEmail)
      ..writeByte(3)
      ..write(obj.businessdetail)
      ..writeByte(4)
      ..write(obj.citizenimage)
      ..writeByte(5)
      ..write(obj.agreementimage)
      ..writeByte(6)
      ..write(obj.renteeId)
      ..writeByte(7)
      ..write(obj.dueAmount)
      ..writeByte(8)
      ..write(obj.advanceAmount)
      ..writeByte(9)
      ..write(obj.renteePanNumber)
      ..writeByte(11)
      ..write(obj.renteePayment);
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
