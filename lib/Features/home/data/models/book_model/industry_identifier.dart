import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'industry_identifier.g.dart';

@HiveType(typeId: 3)
class IndustryIdentifier extends Equatable {
  @HiveField(0)
  final String? type;
  @HiveField(1)
  final String? identifier;

  const IndustryIdentifier({this.type, this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};

  @override
  List<Object?> get props => [type, identifier];
}
