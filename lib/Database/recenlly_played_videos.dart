import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class RecentlyPlayedData {
  @HiveField(0)
  final String videoPath;

  @HiveField(1)
  final DateTime timestamp;

  @HiveField(2)
  final Duration? current;

  @HiveField(3)
  final Duration? full;

  RecentlyPlayedData({
    required this.videoPath,
    required this.timestamp,
    this.current,
    this.full,
  });
}

class RecentlyPlayedDataAdapter extends TypeAdapter<RecentlyPlayedData> {
  @override
  final int typeId = 0;

  @override
  RecentlyPlayedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentlyPlayedData(
      videoPath: fields[0] as String,
      timestamp: fields[1] as DateTime,
      current: fields[2] as Duration?,
      full: fields[3] as Duration?,
    );
  }

  @override
  void write(BinaryWriter writer, RecentlyPlayedData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.videoPath)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.current)
      ..writeByte(3)
      ..write(obj.full);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentlyPlayedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
