import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase that gets the popular movies.
final class GetPopularMoviesUseCase
    extends BaseUseCase<ResponseModel<List<MovieEntity>>, NoParams> {
  /// [GetPopularMoviesUseCase] constructor.
  const GetPopularMoviesUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  @override
  Future<ResponseModel<List<MovieEntity>>> call(NoParams params) async {
    return movieRepository.getPopularMovies();
  }
}
