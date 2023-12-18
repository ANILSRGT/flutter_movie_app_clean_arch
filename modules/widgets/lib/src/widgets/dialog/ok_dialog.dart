import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:widgets/src/core/dialog_base.dart';

/// A dialog that shows an error message.
final class OKDialog extends StatelessWidget {
  /// Creates an error dialog.
  const OKDialog({
    required this.title,
    this.content,
    super.key,
  });

  /// The title of the dialog.
  final String title;

  /// The content of the dialog.
  final String? content;

  /// Shows an error dialog.
  /// [title] is the title of the dialog.
  static Future<bool> show({
    required BuildContext context,
    required String title,
    String? content,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) {
        return OKDialog(
          title: title,
          content: content,
        );
      },
    );

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: content != null ? Text(content!) : null,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Iconify(MaterialSymbols.done_rounded),
        ),
      ],
    );
  }
}
