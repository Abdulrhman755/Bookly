import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
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
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                  ),
                ),
                const SizedBox(height: 43),
                Text(
                  bookModel.volumeInfo.title ?? '',
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  bookModel.volumeInfo.authors?[0] ?? '',
                  style: Styles.textStyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  rating: (bookModel.volumeInfo.averageRating ?? 0).toDouble(),
                  ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
                ),
                const SizedBox(height: 37),
                BooksAction(bookModel: bookModel),
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
