import 'package:flutter_movie_app/core/model/response_model.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_genre_entity.dart';

/// [MovieGenreRepository] is an abstract class that defines the
/// methods that any
/// concrete implementation of [MovieGenreRepository] must implement.
abstract class MovieGenreRepository {
  /// Fetches the list of genres.
  Future<ResponseModel<List<MovieGenreEntity>>> getMovieGenres();

  /// Fetches the genre by id.
  Future<ResponseModel<MovieGenreEntity>> getMovieGenreById(int genreId);
}
