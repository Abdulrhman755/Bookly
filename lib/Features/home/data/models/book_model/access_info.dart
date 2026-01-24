import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'epub.dart';
import 'pdf.dart';

part 'access_info.g.dart';

@HiveType(typeId: 7)
class AccessInfo extends Equatable {
  @HiveField(0)
  final String? country;
  @HiveField(1)
  final String? viewability;
  @HiveField(2)
  final bool? embeddable;
  @HiveField(3)
  final bool? publicDomain;
  @HiveField(4)
  final String? textToSpeechPermission;
  @HiveField(5)
  final Epub? epub;
  @HiveField(6)
  final Pdf? pdf;
  @HiveField(7)
  final String? webReaderLink;
  @HiveField(8)
  final String? accessViewStatus;
  @HiveField(9)
  final bool? quoteSharingAllowed;

  const AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
    country: json['country'] as String?,
    viewability: json['viewability'] as String?,
    embeddable: json['embeddable'] as bool?,
    publicDomain: json['publicDomain'] as bool?,
    textToSpeechPermission: json['textToSpeechPermission'] as String?,
    epub:
        json['epub'] == null
            ? null
            : Epub.fromJson(json['epub'] as Map<String, dynamic>),
    pdf:
        json['pdf'] == null
            ? null
            : Pdf.fromJson(json['pdf'] as Map<String, dynamic>),
    webReaderLink: json['webReaderLink'] as String?,
    accessViewStatus: json['accessViewStatus'] as String?,
    quoteSharingAllowed: json['quoteSharingAllowed'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'country': country,
    'viewability': viewability,
    'embeddable': embeddable,
    'publicDomain': publicDomain,
    'textToSpeechPermission': textToSpeechPermission,
    'epub': epub?.toJson(),
    'pdf': pdf?.toJson(),
    'webReaderLink': webReaderLink,
    'accessViewStatus': accessViewStatus,
    'quoteSharingAllowed': quoteSharingAllowed,
  };

  @override
  List<Object?> get props {
    return [
      country,
      viewability,
      embeddable,
      publicDomain,
      textToSpeechPermission,
      epub,
      pdf,
      webReaderLink,
      accessViewStatus,
      quoteSharingAllowed,
    ];
  }
}
