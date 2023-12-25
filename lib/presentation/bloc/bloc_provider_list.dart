import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/presentation/bloc/movie/movie_cubit.dart';

/// [BlocProviderList] is a class that contains all [BlocProvider]s in the app.
@immutable
final class BlocProviderList {
  /// Factory constructor for [BlocProviderList]
  List<BlocProvider> get providers => [
        BlocProvider<MovieCubit>(create: (_) => MovieCubit()),
      ];
}
