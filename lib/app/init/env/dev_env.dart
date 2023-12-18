import 'package:envied/envied.dart';
import 'package:flutter_movie_app/app/init/env/env.dart';

part 'dev_env.g.dart';

/// Debug environment.
@Envied(name: 'DevEnv', path: 'assets/env/.dev.env')
final class DevEnv implements Env {
  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _DevEnv.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY')
  final String apiKey = _DevEnv.apiKey;

  @override
  @EnviedField(varName: 'IMAGE_BASE_URL')
  final String baseImageUrl = _DevEnv.baseImageUrl;
}
