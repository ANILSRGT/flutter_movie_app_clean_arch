// ignore_for_file: inference_failure_on_function_invocation

import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_movie_app/app/init/env/app_env.dart';
import 'package:flutter_movie_app/data/datasources/movie/genre/movie_genre_remote_data_source.dart';
import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';
import 'package:http/http.dart' as http;
import 'package:kartal/kartal.dart';

/// Movie remote data source abstract class.
final class MovieGenreRemoteDataSourceImpl extends MovieGenreRemoteDataSource {
  /// [MovieGenreRemoteDataSourceImpl] constructor.
  MovieGenreRemoteDataSourceImpl(this.client);

  /// Dio instance.
  final http.Client client;

  String get _baseUrl => AppEnv.instance.env.baseUrl;
  String get _apiKey => AppEnv.instance.env.apiKey;

  @override
  Future<ResponseModel<List<MovieGenreModel>>> getMovieGenres() async {
    try {
      final response = await client
          .get(Uri.parse('$_baseUrl/genre/movie/list?api_key=$_apiKey'));

      if (response.statusCode != 200) {
        return const ResponseModelSuccessNegative(message: 'fail');
      }

      final body = response.body;
      final dataDecode = jsonDecode(body) as Map<String, dynamic>;
      final results = dataDecode['genres'] as List<dynamic>;
      final genres = results
          .map((e) => MovieGenreModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return ResponseModelSuccessPositive(data: genres);
    } catch (e) {
      return const ResponseModelFail(message: 'fail');
    }
  }

  @override
  Future<ResponseModel<MovieGenreModel>> getMovieGenreById(int id) async {
    try {
      final response = await getMovieGenres();

      if (response.isNotSuccessPositive) {
        return response.isFail
            ? response.asFail.convertTo<MovieGenreModel>()
            : response.asSuccessNegative.convertTo<MovieGenreModel>();
      }

      final genres = response.asSuccessPositive.data;
      final genre = genres.firstWhereOrNull((element) => element.id == id);

      if (genre == null) {
        return const ResponseModelSuccessNegative(message: 'negative');
      }

      return ResponseModelSuccessPositive(data: genre);
    } catch (e) {
      return const ResponseModelFail(message: 'fail');
    }
  }
}
