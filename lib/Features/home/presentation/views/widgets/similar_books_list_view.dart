import 'package:bookly/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl:
                  'https://img.freepik.com/free-vector/vector-blank-book-cover-isolated-white_1284-41904.jpg?t=st=1736846227~exp=1736849827~hmac=62174f762635951662cf065f422709146f4772076046e7279761f22497645168&w=740',
            ),
          );
        },
      ),
    );
  }
}
