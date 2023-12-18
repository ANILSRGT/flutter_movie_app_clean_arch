import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase that gets the movie poster url.
final class GetMoviePosterUrlUseCase extends BaseUseCase<String, MovieEntity> {
  /// [GetMoviePosterUrlUseCase] constructor.
  const GetMoviePosterUrlUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  @override
  Future<String> call(MovieEntity params) async {
    return movieRepository.getMoviePosterUrl(params.posterPath);
  }
}
