import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomFadingWidget extends StatelessWidget {
  const CustomFadingWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[600]!,
      highlightColor: Colors.grey[400]!,
      child: child,
    );
  }
}
