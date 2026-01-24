import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl, this.heroTag});
  final String? imageUrl;
  final Object? heroTag;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Hero(
          tag: heroTag ?? imageUrl ?? '',
          child:
              (imageUrl == null || imageUrl!.isEmpty)
                  ? const Center(child: Icon(Icons.error))
                  : CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.fill,
                    errorWidget: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
        ),
      ),
    );
  }
}
