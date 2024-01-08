// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listBox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListBoxAdapter extends TypeAdapter<ListBox> {
  @override
  final int typeId = 4;

  @override
  ListBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListBox(
      selectedList: (fields[0] as List).cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.selectedList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
