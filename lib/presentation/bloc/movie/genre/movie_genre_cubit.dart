import 'package:core/core.dart';


import 'package:flutter/foundation.dart';


import 'package:flutter_movie_app/app/app_container.dart';


import 'package:flutter_movie_app/data/models/movie/movie_genre_model.dart';


import 'package:flutter_movie_app/domain/usecases/movie/genre/get_movie_genres_usecase.dart';


part 'movie_genre_state.dart';


/// The cubit that manages the state of the movies


final class MovieGenreCubit extends BaseCubit<MovieGenreState> {

  /// [MovieGenreCubit] constructor


  MovieGenreCubit() : super(initialState: MovieGenreInitial());


  /// The method that fetches the movies


  Future<void> fetchPopularMovies() async {

    emit(MovieGenreLoading());


    final moviesGenresRes =

        await AppContainer.read<GetMovieGenresUseCase>().call(NoParams());


    if (moviesGenresRes.isNotSuccessPositive) {

      emit(

        MovieGenreError(

          message: moviesGenresRes.isFail

              ? moviesGenresRes.asFail.message

              : moviesGenresRes.asSuccessNegative.message,

        ),

      );

    }


    emit(

      MovieGenreUpdated(

        movieGenres:

            moviesGenresRes.asSuccessPositive.data as List<MovieGenreModel>,

      ),

    );

  }

}

