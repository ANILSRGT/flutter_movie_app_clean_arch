import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// [MovieCard] is movie card widget
/// [T] is id type
class MovieCard<T> extends StatelessWidget {
  /// [MovieCard] constructor
  const MovieCard({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    this.onTap,
    this.descriptionMaxLines = 2,
    this.shadowBlurRadius = 8,
    this.shadowOffset = const Offset(2, 4),
    super.key,
  });

  /// [id] is id of movie
  final T id;

  /// [title] is title of movie
  final String title;

  /// [image] is image of movie
  final ImageProvider? image;

  /// [description] is description of movie
  final String description;

  /// [onTap] is function of movie card
  final void Function(T id)? onTap;

  /// [descriptionMaxLines] is max lines of description
  final int descriptionMaxLines;

  /// [shadowBlurRadius] is blur radius of shadow
  final double shadowBlurRadius;

  /// [shadowOffset] is shadow offset of shadow
  final Offset shadowOffset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(id),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: context.border.normalBorderRadius,
          color: context.general.colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: context.general.colorScheme.onBackground.withOpacity(0.2),
              blurRadius: shadowBlurRadius,
              blurStyle: BlurStyle.inner,
              offset: shadowOffset,
            ),
          ],
          image: image != null
              ? DecorationImage(
                  colorFilter: ColorFilter.mode(
                    context.general.colorScheme.background.withOpacity(0.2),
                    BlendMode.multiply,
                  ),
                  image: image!,
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _buildImageContent(context),
      ),
    );
  }

  Padding _buildImageContent(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.general.textTheme.titleLarge?.copyWith(
              color: context.general.colorScheme.onBackground,
            ),
          ),
          Text(
            description,
            maxLines: descriptionMaxLines,
            overflow: TextOverflow.ellipsis,
            style: context.general.textTheme.bodyMedium?.copyWith(
              color: context.general.colorScheme.onBackground.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}
