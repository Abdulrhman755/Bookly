import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'epub.g.dart';

@HiveType(typeId: 9)
class Epub extends Equatable {
  @HiveField(0)
  final bool? isAvailable;
  @HiveField(1)
  final String? downloadLink;

  const Epub({this.isAvailable, this.downloadLink});

  factory Epub.fromJson(Map<String, dynamic> json) => Epub(
    isAvailable: json['isAvailable'] as bool?,
    downloadLink: json['downloadLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'isAvailable': isAvailable,
    'downloadLink': downloadLink,
  };

  @override
  List<Object?> get props => [isAvailable, downloadLink];
}
