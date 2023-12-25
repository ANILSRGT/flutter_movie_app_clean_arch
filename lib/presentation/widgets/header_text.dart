import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

/// [HeaderText] is header text widget
class HeaderText extends StatelessWidget {
  /// [HeaderText] constructor
  const HeaderText({
    required this.text,
    super.key,
  });

  /// [text] is text of header
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.headlineSmall,
    );
  }
}
