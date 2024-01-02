import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Custom cached network image widget that extends [CachedNetworkImage]
class CustomCachedNetworkImage extends CachedNetworkImage {
  /// [CustomCachedNetworkImage] constructor
  CustomCachedNetworkImage({
    required super.imageUrl,
    super.placeholder,
    super.errorWidget,
    super.key,
  });

  /// Provides [CustomCachedNetworkImageProvider] instance
  CustomCachedNetworkImageProvider get toProvider =>
      CustomCachedNetworkImageProvider(image: this);
}

/// Custom cached network image provider that extends [ImageProvider]
class CustomCachedNetworkImageProvider
    extends ImageProvider<CustomCachedNetworkImage> {
  /// [CustomCachedNetworkImageProvider] constructor
  const CustomCachedNetworkImageProvider({
    required this.image,
  });

  /// [CustomCachedNetworkImage] instance
  final CustomCachedNetworkImage image;

  @override
  Future<CustomCachedNetworkImage> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<CustomCachedNetworkImage>(image);
  }
}
