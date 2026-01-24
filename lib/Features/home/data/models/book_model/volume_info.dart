import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'image_links.dart';
import 'industry_identifier.dart';
import 'panelization_summary.dart';
import 'reading_modes.dart';

part 'volume_info.g.dart';

@HiveType(typeId: 1)
class VolumeInfo extends Equatable {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final List<String>? authors;
  @HiveField(2)
  final String? publishedDate;
  @HiveField(3)
  final List<IndustryIdentifier>? industryIdentifiers;
  @HiveField(4)
  final ReadingModes? readingModes;
  @HiveField(5)
  final int? pageCount;
  @HiveField(6)
  final String? printType;
  @HiveField(7)
  final List<String>? categories;
  @HiveField(8)
  final String? maturityRating;
  @HiveField(9)
  final bool? allowAnonLogging;
  @HiveField(10)
  final String? contentVersion;
  @HiveField(11)
  final PanelizationSummary? panelizationSummary;
  @HiveField(12)
  final ImageLinks? imageLinks;
  @HiveField(13)
  final num? averageRating;
  @HiveField(14)
  final int? ratingsCount;
  @HiveField(15)
  final String? language;
  @HiveField(16)
  final String? previewLink;
  @HiveField(17)
  final String? infoLink;
  @HiveField(18)
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.title,
    this.authors,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.averageRating,
    this.ratingsCount,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
    title: json['title'] as String?,
    authors: (json['authors'] as List<dynamic>?)?.cast<String>(),
    publishedDate: json['publishedDate'] as String?,
    industryIdentifiers:
        (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
            .toList(),
    readingModes:
        json['readingModes'] == null
            ? null
            : ReadingModes.fromJson(
              json['readingModes'] as Map<String, dynamic>,
            ),
    pageCount: json['pageCount'] as int?,
    printType: json['printType'] as String?,
    categories: (json['categories'] as List<dynamic>?)?.cast<String>(),
    maturityRating: json['maturityRating'] as String?,
    allowAnonLogging: json['allowAnonLogging'] as bool?,
    contentVersion: json['contentVersion'] as String?,
    panelizationSummary:
        json['panelizationSummary'] == null
            ? null
            : PanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>,
            ),
    imageLinks:
        json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks'] as Map<String, dynamic>),
    averageRating: json['averageRating'] as num?,
    ratingsCount: json['ratingsCount'] as int?,
    language: json['language'] as String?,
    previewLink: json['previewLink'] as String?,
    infoLink: json['infoLink'] as String?,
    canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'publishedDate': publishedDate,
    'industryIdentifiers': industryIdentifiers?.map((e) => e.toJson()).toList(),
    'readingModes': readingModes?.toJson(),
    'pageCount': pageCount,
    'printType': printType,
    'categories': categories,
    'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    'contentVersion': contentVersion,
    'panelizationSummary': panelizationSummary?.toJson(),
    'imageLinks': imageLinks?.toJson(),
    'averageRating': averageRating,
    'ratingsCount': ratingsCount,
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
    'canonicalVolumeLink': canonicalVolumeLink,
  };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publishedDate,
      industryIdentifiers,
      readingModes,
      pageCount,
      printType,
      categories,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      averageRating,
      ratingsCount,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
