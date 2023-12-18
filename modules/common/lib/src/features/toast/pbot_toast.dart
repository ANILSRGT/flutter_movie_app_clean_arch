import 'package:bot_toast/bot_toast.dart';
import 'package:common/src/features/toast/ptoast.dart';
import 'package:flutter/material.dart';

/// From Bot Toast package (https://pub.dev/packages/bot_toast)
final class PBotToast extends PToast {
  @override
  Widget build(BuildContext context, Widget? child) =>
      BotToastInit()(context, child);

  @override
  NavigatorObserver get observer => BotToastNavigatorObserver();

  @override
  Future<void> showText({
    required String text,
    PToastType type = PToastType.info,
    PToastPosition position = PToastPosition.bottom,
    PToastDuration duration = PToastDuration.normal,
    ToasterStateBuilder backgroundColor = defaultBackgroundColor,
    ToasterStateBuilder foregroundColor = defaultForegroundColor,
    TextStyle? textStyle,
    VoidCallback? onClose,
    bool cancelPrevious = true,
  }) async {
    if (cancelPrevious) cancel();

    BotToast.showText(
      text: text,
      align: position == PToastPosition.top
          ? Alignment.topCenter
          : position == PToastPosition.bottom
              ? Alignment.bottomCenter
              : Alignment.center,
      duration: duration.value,
      backgroundColor: backgroundColor(type),
      contentColor: foregroundColor(type),
      textStyle: textStyle?.copyWith(color: foregroundColor(type)) ??
          TextStyle(color: foregroundColor(type)),
      onClose: onClose,
    );
  }

  @override
  void cancel() {
    BotToast.closeAllLoading();
    BotToast.cleanAll();
  }
}
