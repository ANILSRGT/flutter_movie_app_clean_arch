import 'package:flutter_movie_app/core/model/response_model.dart';
import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';

/// Movie remote data source abstract class.
abstract class MovieGenreRemoteDataSource {
  /// Gets the list of genres.
  /// <br/>Returns a list of [MovieGenreModel] wrapped with [ResponseModelSuccessPositive]
  /// if the request is successful.
  /// <br/>Returns a [ResponseModelSuccessNegative] if the request is successful (no data)
  /// <br/>Returns a [ResponseModelFail] if the request is unsuccessful.
  Future<ResponseModel<List<MovieGenreModel>>> getMovieGenres();

  /// Gets the genre by id.
  /// <br/>Returns a [MovieGenreModel] wrapped with [ResponseModelSuccessPositive]
  /// if the request is successful.
  /// <br/>Returns a [ResponseModelSuccessNegative] if the request is successful (no data)
  /// <br/>Returns a [ResponseModelFail] if the request is unsuccessful.
  Future<ResponseModel<MovieGenreModel>> getMovieGenreById(int id);
}
