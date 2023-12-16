import 'package:flutter_movie_app/core/base/base_usecase.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source_impl.dart';
import 'package:flutter_movie_app/data/repositories/genre/movie_genre_repository_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie/movie_genre_repositort.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genre_by_id_usecase.dart';
import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genres_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('Movie Genre UseCases', () {
    late http.Client client;
    late MovieGenreRemoteDataSource movieGenreRemoteDataSource;
    late MovieGenreRepository movieGenreRepository;
    late GetMovieGenresUseCase getMovieGenresUseCase;
    late GetMovieGenreByIdUseCase getMovieGenreByIdUseCase;

    setUp(() {
      client = http.Client();
      movieGenreRemoteDataSource = MovieGenreRemoteDataSourceImpl(client);
      movieGenreRepository =
          MovieGenreRepositoryImpl(movieGenreRemoteDataSource);
      getMovieGenresUseCase = GetMovieGenresUseCase(movieGenreRepository);
      getMovieGenreByIdUseCase = GetMovieGenreByIdUseCase(movieGenreRepository);
    });

    test('should return a list of genres', () async {
      // arrange
      // act
      final result = await getMovieGenresUseCase.call(NoParams());
      // assert
      expect(result.isSuccessPositive, true);
      expect(result.asSuccessPositive.data, isList);
      expect(result.asSuccessPositive.data, isNotEmpty);
    });

    test('should return a genre by id', () async {
      // arrange
      // act
      final result = await getMovieGenreByIdUseCase.call(16);
      // assert
      expect(result.isSuccessPositive, true);
    });
  });
}
