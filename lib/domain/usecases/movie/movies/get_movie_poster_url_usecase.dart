import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase that gets the movie poster url.
final class GetMoviePosterUrlUseCase extends BaseUseCase<String, String> {
  /// [GetMoviePosterUrlUseCase] constructor.
  const GetMoviePosterUrlUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  /// [params] is the poster path.
  @override
  Future<String> call(String params) async {
    return movieRepository.getMoviePosterUrl(params);
  }
}
