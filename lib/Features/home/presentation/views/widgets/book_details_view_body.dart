import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
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
                  style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 16),
                const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                const SizedBox(height: 37),
                const BooksAction(),
                Expanded(child: const SizedBox(height: 50)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You may also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const SimilarBooksListView(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
