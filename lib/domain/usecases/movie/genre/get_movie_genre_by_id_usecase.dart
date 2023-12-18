import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_genre_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_genre_repositort.dart';

/// A usecase that gets the movie genre by id.
final class GetMovieGenreByIdUseCase
    extends BaseUseCase<ResponseModel<MovieGenreEntity>, int> {
  /// [GetMovieGenreByIdUseCase] constructor.
  const GetMovieGenreByIdUseCase(this.movieGenreRepository);

  /// A [MovieGenreRepository] instance.
  final MovieGenreRepository movieGenreRepository;

  @override
  Future<ResponseModel<MovieGenreEntity>> call(int params) async {
    return movieGenreRepository.getMovieGenreById(params);
  }
}
