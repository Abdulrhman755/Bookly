import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'search_info.g.dart';

@HiveType(typeId: 8)
class SearchInfo extends Equatable {
  @HiveField(0)
  final String? textSnippet;

  const SearchInfo({this.textSnippet});

  factory SearchInfo.fromJson(Map<String, dynamic> json) =>
      SearchInfo(textSnippet: json['textSnippet'] as String?);

  Map<String, dynamic> toJson() => {'textSnippet': textSnippet};

  @override
  List<Object?> get props => [textSnippet];
}
