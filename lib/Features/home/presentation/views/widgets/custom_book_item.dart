import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.book01),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
      ),
    );
  }
}
