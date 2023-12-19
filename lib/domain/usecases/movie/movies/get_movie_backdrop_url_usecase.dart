import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase that gets the movie backdrop url.
final class GetMovieBackdropUrlUseCase extends BaseUseCase<String, String> {
  /// [GetMovieBackdropUrlUseCase] constructor.
  const GetMovieBackdropUrlUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  /// [params] is the movie backdrop path.
  @override
  Future<String> call(String params) async {
    return movieRepository.getMovieBackdropUrl(params);
  }
}
