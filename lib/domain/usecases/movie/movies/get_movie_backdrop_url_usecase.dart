import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase that gets the movie backdrop url.
final class GetMovieBackdropUrlUseCase
    extends BaseUseCase<String, MovieEntity> {
  /// [GetMovieBackdropUrlUseCase] constructor.
  const GetMovieBackdropUrlUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  @override
  Future<String> call(MovieEntity params) async {
    return movieRepository.getMovieBackdropUrl(params.backdropPath);
  }
}
