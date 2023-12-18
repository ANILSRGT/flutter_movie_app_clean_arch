import 'package:core/core.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_genre_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_genre_repositort.dart';

/// A usecase that gets the movie genres.
final class GetMovieGenresUseCase
    extends BaseUseCase<ResponseModel<List<MovieGenreEntity>>, NoParams> {
  /// [GetMovieGenresUseCase] constructor.
  const GetMovieGenresUseCase(this.movieGenreRepository);

  /// A [MovieGenreRepository] instance.
  final MovieGenreRepository movieGenreRepository;

  @override
  Future<ResponseModel<List<MovieGenreEntity>>> call(NoParams params) async {
    return movieGenreRepository.getMovieGenres();
  }
}
