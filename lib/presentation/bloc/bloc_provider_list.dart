import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/presentation/bloc/movie/genre/movie_genre_cubit.dart';
import 'package:flutter_movie_app/presentation/bloc/movie/movies/movie_cubit.dart';

/// [BlocProviderList] is a class that contains all [BlocProvider]s in the app.
@immutable
final class BlocProviderList {
  /// Factory constructor for [BlocProviderList]
  List<BlocProvider> get providers => [
        BlocProvider<MovieCubit>(create: (_) => MovieCubit()),
        BlocProvider<MovieGenreCubit>(create: (_) => MovieGenreCubit()),
      ];
}
