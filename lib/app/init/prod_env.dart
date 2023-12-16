import 'package:envied/envied.dart';
import 'package:flutter_movie_app/app/init/env.dart';

part 'prod_env.g.dart';

/// Debug environment.
@Envied(name: 'ProdEnv', path: 'assets/env/.prod.env')
final class ProdEnv implements Env {
  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _ProdEnv.baseUrl;

  @override
  @EnviedField(varName: 'API_KEY')
  final String apiKey = _ProdEnv.apiKey;

  @override
  @EnviedField(varName: 'IMAGE_BASE_URL')
  final String baseImageUrl = _ProdEnv.baseImageUrl;
}
