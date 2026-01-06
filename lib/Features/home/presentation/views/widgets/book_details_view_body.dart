import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.17),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 43),
          const Text('The Jungle Book', style: Styles.textStyle30),
          const SizedBox(height: 6),
          Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
