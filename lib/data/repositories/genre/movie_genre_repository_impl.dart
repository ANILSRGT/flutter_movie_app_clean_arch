import 'package:flutter_movie_app/core/model/response_model.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source.dart';
import 'package:flutter_movie_app/domain/entities/movie/movie_genre_entity.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_genre_repositort.dart';

/// [MovieGenreRepositoryImpl] is the implementation of [MovieGenreRepository]
class MovieGenreRepositoryImpl extends MovieGenreRepository {
  /// [MovieGenreRepositoryImpl] constructor
  MovieGenreRepositoryImpl(this.movieGenreRemoteDataSource);

  /// [movieGenreRemoteDataSource] instance of [MovieGenreRemoteDataSource]
  final MovieGenreRemoteDataSource movieGenreRemoteDataSource;

  @override
  Future<ResponseModel<List<MovieGenreEntity>>> getMovieGenres() =>
      movieGenreRemoteDataSource.getMovieGenres();

  @override
  Future<ResponseModel<MovieGenreEntity>> getMovieGenreById(int genreId) =>
      movieGenreRemoteDataSource.getMovieGenreById(genreId);
}
