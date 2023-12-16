import 'package:flutter/foundation.dart';
import 'package:flutter_movie_app/app/init/dev_env.dart';
import 'package:flutter_movie_app/app/init/env.dart';
import 'package:flutter_movie_app/app/init/prod_env.dart';

/// This class is used to get the environment according to the build type.
@immutable
final class AppEnv {
  const AppEnv._init();

  /// Singleton instance of [AppEnv].
  static const AppEnv instance = AppEnv._init();

  /// Returns the environment according to the build type.
  /// if the build type is debug, it returns [DevEnv].
  /// if the build type is profile or release, it returns [ProdEnv].
  Env get env => kDebugMode ? DevEnv() : ProdEnv();
}
