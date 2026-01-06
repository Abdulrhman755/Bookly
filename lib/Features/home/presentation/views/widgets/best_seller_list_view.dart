import 'package:flutter/material.dart';

import 'book_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const BookSellerListViewItem(),
        );
      }, childCount: 10),
    );
  }
}
