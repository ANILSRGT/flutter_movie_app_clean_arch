import 'package:common/src/features/index.dart';

/// Toaster factory
final class PToaster {
  /// [PToaster] constructor
  PToaster(this._toast);

  /// [PToast] instance
  final PToast _toast;

  /// [PToast] instance
  PToast get toast => _toast;
}
