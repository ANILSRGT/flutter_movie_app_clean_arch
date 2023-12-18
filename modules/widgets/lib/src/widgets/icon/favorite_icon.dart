import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

/// [FavoriteIcon] is the favorite icon button of the app
class FavoriteIcon extends StatelessWidget {
  /// [FavoriteIcon] constructor
  const FavoriteIcon({
    required this.isFavorite,
    this.favoriteIcon,
    this.unFavoriteIcon,
    this.favoriteColor,
    this.unFavoriteColor,
    super.key,
  });

  /// [isFavorite] is the value of the favorite icon button
  final bool isFavorite;

  /// [favoriteIcon] is the custom icon of the favorite icon button
  /// if it is null, the default icon will be used
  /// default icon is [Iconify] with [MaterialSymbols.favorite_rounded]
  final Widget? favoriteIcon;

  /// [unFavoriteIcon] is the custom icon of the favorite icon button
  /// if it is null, the default icon will be used
  /// default icon is [Iconify] with [MaterialSymbols.favorite_outline_rounded]
  final Widget? unFavoriteIcon;

  /// [favoriteColor] is the custom color of the favorite icon button
  /// if it is null, the default color will be used
  /// default color is [Theme.of(context).iconTheme.color]
  final Color? favoriteColor;

  /// [unFavoriteColor] is the custom color of the favorite icon button
  /// if it is null, the default color will be used
  /// default color is [Theme.of(context).iconTheme.color]
  final Color? unFavoriteColor;

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? favoriteIcon ??
            Iconify(
              MaterialSymbols.favorite_rounded,
              color: favoriteColor ?? Theme.of(context).iconTheme.color,
              size: 28,
            )
        : unFavoriteIcon ??
            Iconify(
              MaterialSymbols.favorite_outline_rounded,
              color: unFavoriteColor ?? Theme.of(context).iconTheme.color,
              size: 28,
            );
  }
}
