import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class BestSellerListViewLoadingIndicator extends StatelessWidget {
  const BestSellerListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 125,
                  child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        height: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 3),
                      Container(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 15,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
