import 'package:flutter_movie_app/app/init/cache/caches/cache_manager.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_local_data_source.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';

/// Movie local data source implementation.
final class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  /// [MovieLocalDataSourceImpl] constructor.
  MovieLocalDataSourceImpl(this.cacheManager);

  /// [CacheManager] instance.
  final CacheManager cacheManager;

  @override
  Future<List<MovieModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }
}
