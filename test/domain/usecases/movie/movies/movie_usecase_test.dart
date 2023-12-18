import 'package:core/core.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/repositories/movie/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_repository.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_popular_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/get_trending_movies_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/movies/search_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Movie UseCases', () {
    late http.Client client;
    late MovieRemoteDataSource movieRemoteDataSource;
    late MovieRepository movieRepository;
    late GetTrendingMoviesUseCase getTrendingMoviesUseCase;
    late GetPopularMoviesUseCase getPopularMoviesUseCase;
    late SearchMoviesUseCase searchMoviesUseCase;

    setUp(() {
      client = http.Client();
      movieRemoteDataSource = MovieRemoteDataSourceImpl(client);
      movieRepository = MovieRepositoryImpl(movieRemoteDataSource);
      getTrendingMoviesUseCase = GetTrendingMoviesUseCase(movieRepository);
      getPopularMoviesUseCase = GetPopularMoviesUseCase(movieRepository);
      searchMoviesUseCase = SearchMoviesUseCase(movieRepository);
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
  });
}
