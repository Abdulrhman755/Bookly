import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'reading_modes.g.dart';

@HiveType(typeId: 4)
class ReadingModes extends Equatable {
  @HiveField(0)
  final bool? text;
  @HiveField(1)
  final bool? image;

  const ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) =>
      ReadingModes(text: json['text'] as bool?, image: json['image'] as bool?);

  Map<String, dynamic> toJson() => {'text': text, 'image': image};

  @override
  List<Object?> get props => [text, image];
}
