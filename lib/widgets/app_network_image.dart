import 'package:alikala/gen/assets.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final String? placeHolderAsset;
  final double? width;
  final double? height;

  const AppNetworkImage({
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeHolderAsset,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      fit: fit,
      width: width,
      height: height,
      placeholder: (_, __) => Image.asset(placeHolderAsset ?? Assets.images.imagePlaceholder.assetName, fit: fit),
    );
  }
}
