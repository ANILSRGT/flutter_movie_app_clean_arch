import 'package:core/core.dart';
import 'package:flutter_movie_app/app/init/env/app_env.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_backdrop_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_movie_poster_url_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_trending_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/search_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Movie UseCases', () {
    late http.Client client;
    late AppEnv appEnv;
    late MovieRemoteDataSource movieRemoteDataSource;
    late MovieRepository movieRepository;
    late GetTrendingMoviesUseCase getTrendingMoviesUseCase;
    late GetPopularMoviesUseCase getPopularMoviesUseCase;
    late SearchMoviesUseCase searchMoviesUseCase;
    late GetMoviePosterUrlUseCase getMoviePosterUrlUseCase;
    late GetMovieBackdropUrlUseCase getMovieBackdropUrlUseCase;

    setUp(() {
      client = http.Client();
      appEnv = AppEnv.instance;
      movieRemoteDataSource = MovieRemoteDataSourceImpl(client);
      movieRepository = MovieRepositoryImpl(movieRemoteDataSource);
      getTrendingMoviesUseCase = GetTrendingMoviesUseCase(movieRepository);
      getPopularMoviesUseCase = GetPopularMoviesUseCase(movieRepository);
      searchMoviesUseCase = SearchMoviesUseCase(movieRepository);
      getMoviePosterUrlUseCase = GetMoviePosterUrlUseCase(movieRepository);
      getMovieBackdropUrlUseCase = GetMovieBackdropUrlUseCase(movieRepository);
    });

    test('should return a list of trending movies', () async {
      final result = await getTrendingMoviesUseCase.call(NoParams());

      expect(result.isSuccessPositive, true);
      expect(result.asSuccessPositive.data, isList);
      expect(result.asSuccessPositive.data, isNotEmpty);
    });

    test('should return a list of popular movies', () async {
      final result = await getPopularMoviesUseCase.call(NoParams());

      expect(result.isSuccessPositive, true);
      expect(result.asSuccessPositive.data, isList);
      expect(result.asSuccessPositive.data, isNotEmpty);
    });

    test('should return a list of searched movies', () async {
      final result = await searchMoviesUseCase.call('a');

      expect(result.isSuccessPositive, true);
      expect(result.asSuccessPositive.data, isList);
      expect(result.asSuccessPositive.data, isNotEmpty);
    });

    test('should return a movie poster url', () async {
      const posterPath = '/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg';
      final result = await getMoviePosterUrlUseCase.call(posterPath);

      expect(result, appEnv.env.baseImageUrl + posterPath);
    });

    test('should return a movie backdrop url', () async {
      const backdropPath = '/1X7vow16X7CnCoexXh4H4F2yDJv.jpg';
      final result = await getMovieBackdropUrlUseCase.call(backdropPath);

      expect(result, appEnv.env.baseImageUrl + backdropPath);
    });
  });
}
