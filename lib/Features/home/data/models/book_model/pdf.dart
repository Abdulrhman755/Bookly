import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'pdf.g.dart';

@HiveType(typeId: 10)
class Pdf extends Equatable {
  @HiveField(0)
  final bool? isAvailable;

  const Pdf({this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) =>
      Pdf(isAvailable: json['isAvailable'] as bool?);

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};

  @override
  List<Object?> get props => [isAvailable];
}
