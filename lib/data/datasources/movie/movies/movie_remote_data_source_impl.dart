// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_movie_app/app/init/env/app_env.dart';
import 'package:flutter_movie_app/data/datasources/movie/movies/movie_remote_data_source.dart';
import 'package:flutter_movie_app/data/models/movie/movie_model.dart';
import 'package:http/http.dart' as http;

/// Movie remote data source implementation.
final class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  /// [MovieRemoteDataSourceImpl] constructor.
  MovieRemoteDataSourceImpl(this.client);

  /// [http.Client] instance.
  final http.Client client;

  String get _baseUrl => AppEnv.instance.env.baseUrl;
  String get _apiKey => AppEnv.instance.env.apiKey;
  String get _baseImageUrl => AppEnv.instance.env.baseImageUrl;

  @override
  Future<ResponseModel<List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await client
          .get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));

      if (response.statusCode != 200) {
        return const ResponseModelSuccessNegative(message: 'fail');
      }

      final body = response.body;
      final dataDecode = jsonDecode(body) as Map<String, dynamic>;
      final results = dataDecode['results'] as List<dynamic>;
      final movies = results
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return ResponseModelSuccessPositive(data: movies);
    } catch (e) {
      return const ResponseModelFail(message: 'fail');
    }
  }

  @override
  Future<ResponseModel<List<MovieModel>>> getTrendingMovies() async {
    try {
      final response = await client
          .get(Uri.parse('$_baseUrl/trending/movie/day?api_key=$_apiKey'));

      if (response.statusCode != 200) {
        return const ResponseModelSuccessNegative(message: 'fail');
      }

      final body = response.body;
      final dataDecode = jsonDecode(body) as Map<String, dynamic>;
      final results = dataDecode['results'] as List<dynamic>;
      final movies = results
          .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return ResponseModelSuccessPositive(data: movies);
    } catch (e) {
      return const ResponseModelFail(message: 'fail');
    }
  }

  @override
  Future<ResponseModel<List<MovieModel>>> searchMovies(String query) async {
    try {
      final response = await client.get(
        Uri.parse('$_baseUrl/search/movie?api_key=$_apiKey&query=$query'),
      );

      if (response.statusCode != 200) {
        return const ResponseModelSuccessNegative(message: 'fail');
      }

      final body = response.body;
      final dataDecode = jsonDecode(body) as Map<String, dynamic>;
      final results = dataDecode['results'] as List<dynamic>;
      final movies = <MovieModel>[];
      for (final element in results) {
        if (element == null) continue;
        movies.add(MovieModel.fromJson(element as Map<String, dynamic>));
      }

      return ResponseModelSuccessPositive(data: movies);
    } catch (e) {
      return const ResponseModelFail(message: 'fail');
    }
  }

  @override
  String getMoviePosterUrl(String moviePosterPath) {
    return '$_baseImageUrl$moviePosterPath';
  }

  @override
  String getMovieBackdropUrl(String movieBackdropPath) {
    return '$_baseImageUrl$movieBackdropPath';
  }
}
