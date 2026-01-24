import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'sale_info.g.dart';

@HiveType(typeId: 6)
class SaleInfo extends Equatable {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? saleability;
  @HiveField(2)
  final bool? isEbook;
  @HiveField(3)
  final String? buyLink;

  const SaleInfo({this.country, this.saleability, this.isEbook, this.buyLink});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
    country: json['country'] as String?,
    saleability: json['saleability'] as String?,
    isEbook: json['isEbook'] as bool?,
    buyLink: json['buyLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'saleability': saleability,
    'isEbook': isEbook,
    'buyLink': buyLink,
  };

  @override
  List<Object?> get props => [country, saleability, isEbook, buyLink];
}
