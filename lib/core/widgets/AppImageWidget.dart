import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_test/core/styles/AppColors.dart';
import 'package:flutter/material.dart';

class AppImageWidget extends StatelessWidget {
  const AppImageWidget({super.key, required this.imageUrl, this.height, this.width,this.fit});
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl??"",
      height: height,
      width: width,
      fit: fit,
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColors.errorColor,
      ),
    );
  }
}
