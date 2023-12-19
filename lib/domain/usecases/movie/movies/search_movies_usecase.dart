import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';

/// A usecase to get movies with a search query.
final class SearchMoviesUseCase
    extends BaseUseCase<ResponseModel<List<MovieEntity>>, String> {
  /// [SearchMoviesUseCase] constructor.
  const SearchMoviesUseCase(this.movieRepository);

  /// A [MovieRepository] instance.
  final MovieRepository movieRepository;

  /// [params] is the search query.
  @override
  Future<ResponseModel<List<MovieEntity>>> call(String params) async {
    return movieRepository.searchMovies(params);
  }
}
