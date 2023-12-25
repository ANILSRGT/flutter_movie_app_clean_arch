import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/app/app_container.dart';
// import 'package:logger/logger.dart';

/// This class is used to initialize the app
@immutable
final class AppInit {
  /// Initialize the app **(Required)**
  static Future<void> setup() async {
    await runZonedGuarded(_initialize, (error, stack) {
      // Logger().e(error);
    });
  }

  static Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );

    // FlutterError.onError = (details) {
    //   Logger().e(details.exceptionAsString());
    // };

    await AppContainer.init();
  }
}
