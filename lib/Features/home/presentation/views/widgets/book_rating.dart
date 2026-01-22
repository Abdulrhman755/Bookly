import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.ratingCount,
  });
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(
          rating.toString(),
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 5),
        Text(
          '($ratingCount)',
          style: Styles.textStyle14.copyWith(
            color: const Color(0xff707070),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
