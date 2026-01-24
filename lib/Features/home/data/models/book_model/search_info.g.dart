// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchInfoAdapter extends TypeAdapter<SearchInfo> {
  @override
  final int typeId = 8;

  @override
  SearchInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchInfo(
      textSnippet: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SearchInfo obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.textSnippet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
