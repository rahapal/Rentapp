// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentAdapter extends TypeAdapter<Payment> {
  @override
  final int typeId = 0;

  @override
  Payment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payment(
      spaceid: fields[0] as int,
      date: fields[1] as String,
      advanceDeposit: fields[2] as double,
      payedAmount: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Payment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.spaceid)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.advanceDeposit)
      ..writeByte(3)
      ..write(obj.payedAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
