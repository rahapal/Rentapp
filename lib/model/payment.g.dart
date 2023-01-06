// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentAdapter extends TypeAdapter<Payment> {
  @override
  final int typeId = 2;

  @override
  Payment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Payment(
      paymentId: fields[0] as String,
      paymentDate: fields[1] as String,
      payedAmount: fields[2] as int,
      paymentNote: fields[3] as String,
      fieldIndex: fields[4] as int,
      refDate: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Payment obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.paymentId)
      ..writeByte(1)
      ..write(obj.paymentDate)
      ..writeByte(2)
      ..write(obj.payedAmount)
      ..writeByte(3)
      ..write(obj.paymentNote)
      ..writeByte(4)
      ..write(obj.fieldIndex)
      ..writeByte(5)
      ..write(obj.refDate);
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
