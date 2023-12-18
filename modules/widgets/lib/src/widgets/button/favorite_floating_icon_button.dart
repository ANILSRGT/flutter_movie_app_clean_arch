import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:widgets/src/widgets/index.dart';

/// [FavoriteFloatingIconButton] is the favorite icon button of the app
class FavoriteFloatingIconButton extends StatefulWidget {
  /// [FavoriteFloatingIconButton] constructor
  const FavoriteFloatingIconButton({
    required this.initIsFavorite,
    this.onFavoriteChanged,
    this.favoriteIcon,
    this.unFavoriteIcon,
    this.favoriteColor,
    this.unFavoriteColor,
    this.backgroundColor,
    this.padding,
    super.key,
  });

  /// [initIsFavorite] is the initial value of the favorite icon button
  final bool initIsFavorite;

  /// [onFavoriteChanged] is the callback function when
  /// the favorite icon button is changed
  final void Function(bool isFavorite)? onFavoriteChanged;

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

  /// [backgroundColor] is the custom background color of
  /// the favorite icon button
  final Color? backgroundColor;

  /// [padding] is the custom padding of the favorite icon button
  final EdgeInsetsGeometry? padding;

  @override
  State<FavoriteFloatingIconButton> createState() =>
      _FavoriteFloatingIconButtonState();
}

class _FavoriteFloatingIconButtonState
    extends State<FavoriteFloatingIconButton> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.initIsFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        widget.onFavoriteChanged?.call(_isFavorite);
      },
      backgroundColor: widget.backgroundColor,
      child: Container(
        padding: widget.padding,
        child: FavoriteIcon(
          isFavorite: _isFavorite,
          favoriteIcon: widget.favoriteIcon,
          unFavoriteIcon: widget.unFavoriteIcon,
          favoriteColor: widget.favoriteColor,
          unFavoriteColor: widget.unFavoriteColor,
        ),
      ),
    );
  }
}
