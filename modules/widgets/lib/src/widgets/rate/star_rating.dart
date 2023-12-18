import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

enum _StarRatingState { filled, percentageFilled, empty }

/// [StarRating] is a widget that shows the rating
class StarRating extends StatelessWidget {
  /// [StarRating] constructor
  const StarRating({
    required this.rateCount,
    required this.rating,
    this.iconSize = 30,
    this.filledIcon,
    this.emptyIcon,
    this.iconMargin = 9,
    this.iconsOffsetY = -3.5,
    this.filledColor,
    this.emptyColor,
    this.textStyle,
    this.reverseText = false,
    super.key,
  })  : assert(
          rating >= 0 && rating <= rateCount,
          'rating must be between 0 and rateCount',
        ),
        assert(rateCount > 0, 'rateCount must be greater than 0'),
        assert(
          !((filledIcon == null) ^ (emptyIcon == null)),
          'filledIcon and emptyIcon must be both null or both not null',
        );

  /// [rateCount] is the number of stars
  final int rateCount;

  /// [rating] is the rating of the product
  final double rating;

  /// [filledIcon] is the icon that will be shown when the star is filled
  final Widget? filledIcon;

  /// [emptyIcon] is the icon that will be shown when the star is empty
  final Widget? emptyIcon;

  /// [iconMargin] is the margin of the icon
  /// <br/><br/>* If the icon has a margin, the percentage filled will be inaccurate
  /// because the icon will be smaller than the original size.
  /// <br/>* So, we need to subtract the margin from the percentage filled
  /// to get the accurate percentage filled
  final double iconMargin;

  /// [iconsOffsetY] is used to align the icons with the text
  final double iconsOffsetY;

  /// [iconSize] is the size of the icon
  final double iconSize;

  /// [filledColor] is the color of the filled star
  /// Default is [ThemeData.colorScheme.primary]
  final Color? filledColor;

  /// [emptyColor] is the color of the empty star
  /// Default is [ThemeData.colorScheme.surface]
  final Color? emptyColor;

  /// [textStyle] is the style of the text
  /// <br/>Default is [ThemeData.textTheme.bodyLarge]
  /// <br/>fontWeight: FontWeight.bold
  final TextStyle? textStyle;

  /// [reverseText] is used to reverse the text and the stars
  final bool reverseText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (reverseText)
          _buildRateText(context)
        else
          ..._buildGenerateStars(context),
        const SizedBox(width: 6),
        if (reverseText)
          ..._buildGenerateStars(context)
        else
          _buildRateText(context),
      ],
    );
  }

  List<Widget> _buildGenerateStars(BuildContext context) {
    return List.generate(
      rateCount,
      (index) => _buildStar(
        context: context,
        index: index,
        rateState: index < rating.floor()
            ? _StarRatingState.filled
            : index == rating.floor()
                ? _StarRatingState.percentageFilled
                : _StarRatingState.empty,
        percentageFilled: rating - rating.floor(),
      ),
    );
  }

  /// [percentageFilled] ranges from 0 to 1
  Widget _buildStar({
    required BuildContext context,
    required int index,
    required _StarRatingState rateState,
    required double percentageFilled,
  }) {
    final primary = Theme.of(context).colorScheme.primary;
    final surface = Theme.of(context).colorScheme.surface;
    return Transform.translate(
      offset: Offset(0, iconsOffsetY),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Iconify(
            rateState == _StarRatingState.filled
                ? MaterialSymbols.star_rounded
                : MaterialSymbols.star_outline_rounded,
            color: rateState == _StarRatingState.filled
                ? filledColor ?? primary
                : emptyColor ?? surface,
            size: iconSize,
          ),
          if (rateState == _StarRatingState.percentageFilled &&
              percentageFilled > 0)
            ClipRect(
              clipper: _CustomStarClipper(percentageFilled, iconMargin),
              child: Iconify(
                MaterialSymbols.star_rounded,
                color: filledColor ?? primary,
                size: iconSize,
              ),
            ),
        ],
      ),
    );
  }

  Text _buildRateText(BuildContext context) {
    return Text(
      ((rating * 10).round() / 10.0).toStringAsFixed(1),
      style: textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
    );
  }
}

class _CustomStarClipper extends CustomClipper<Rect> {
  _CustomStarClipper(
    this.percentageFilled,
    this.iconMargin,
  );
  final double percentageFilled;
  final double iconMargin;

  @override
  Rect getClip(Size size) {
    final width = size.width - iconMargin;
    return Rect.fromLTRB(
      iconMargin * 0.5,
      0,
      width * percentageFilled + iconMargin * 0.5,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
