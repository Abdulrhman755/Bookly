import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/models/book_model/image_links.dart';
import 'package:bookly/Features/home/data/models/book_model/volume_info.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookSellerListViewItem(
            bookModel: BookModel(
              volumeInfo: VolumeInfo(
                title: '',
                imageLinks: ImageLinks(thumbnail: '', smallThumbnail: ''),
              ),
            ),
          ),
        );
      },
    );
  }
}
