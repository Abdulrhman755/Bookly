import 'package:bookly/Features/home/data/models/book_model/access_info.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/epub.dart';
import 'package:bookly/Features/home/data/models/book_model/image_links.dart';
import 'package:bookly/Features/home/data/models/book_model/industry_identifier.dart';
import 'package:bookly/Features/home/data/models/book_model/panelization_summary.dart';
import 'package:bookly/Features/home/data/models/book_model/pdf.dart';
import 'package:bookly/Features/home/data/models/book_model/reading_modes.dart';
import 'package:bookly/Features/home/data/models/book_model/sale_info.dart';
import 'package:bookly/Features/home/data/models/book_model/search_info.dart';
import 'package:bookly/Features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

void setupHive() {
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  Hive.registerAdapter(IndustryIdentifierAdapter());
  Hive.registerAdapter(ReadingModesAdapter());
  Hive.registerAdapter(PanelizationSummaryAdapter());
  Hive.registerAdapter(SaleInfoAdapter());
  Hive.registerAdapter(AccessInfoAdapter());
  Hive.registerAdapter(SearchInfoAdapter());
  Hive.registerAdapter(EpubAdapter());
  Hive.registerAdapter(PdfAdapter());
}

Future<void> openHiveBoxes() async {
  await Future.wait([
    Hive.openBox<BookModel>(kFeaturedBox),
    Hive.openBox<BookModel>(kNewestBox),
  ]);
}
