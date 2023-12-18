/// Abstract environment.
abstract interface class Env {
  /// Base url for api requests.
  abstract final String baseUrl;

  /// Api key for api requests.
  abstract final String apiKey;

  /// Base image url for api requests.
  abstract final String baseImageUrl;
}
