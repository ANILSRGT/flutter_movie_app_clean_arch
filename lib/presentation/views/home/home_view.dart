import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/presentation/bloc/movie/movie_cubit.dart';
import 'package:flutter_movie_app/presentation/views/home/cubit/home_view_cubit.dart';
import 'package:flutter_movie_app/presentation/widgets/header_text.dart';
import 'package:flutter_movie_app/presentation/widgets/movie/introduction_movie_card.dart';
import 'package:flutter_movie_app/presentation/widgets/movie/movie_card.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

part 'home_view_mixin.dart';

/// [HomeView] screen
@RoutePage()
class HomeView extends StatefulWidget {
  /// [HomeView] constructor
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView>
    with HomeViewMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewCubit>(
      create: (_) => homeViewCubit,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        context.sized.emptySizedHeightBoxNormal.ext.sliver,
        _buildIntroduction().ext.sliver,
        context.sized.emptySizedHeightBoxLow3x.ext.sliver,
        SliverPadding(
          padding: context.padding.horizontalNormal,
          sliver: const HeaderText(text: 'Popular Movies').ext.sliver,
        ),
        context.sized.emptySizedHeightBoxLow.ext.sliver,
        _buildPopularMoviesSliver().ext.sliver,
        context.sized.emptySizedHeightBoxNormal.ext.sliver,
      ],
    );
  }

  Widget _buildIntroduction() {
    // TODO: Implement introduction movie card
    final movieCubit = context.watch<MovieCubit>();
    final movies = movieCubit.state.popularMovies.take(3).toList();
    return CarouselSlider.builder(
      options: CarouselOptions(
        clipBehavior: Clip.none,
        height: context.sized.dynamicHeight(0.2),
        viewportFraction: 0.75,
        enlargeFactor: 0.25,
        enlargeCenterPage: true,
      ),
      itemCount: movies.length,
      itemBuilder: (_, index, realIndex) {
        final backdropPath = movieCubit
            .state.popularMoviesBackdropPaths[movies[index].id.toString()];
        return SizedBox(
          width: double.infinity,
          child: IntroductionMovieCard(
            id: index,
            onTap: (id) {},
            title: movies[index].title ?? '',
            image: backdropPath.nullOr(NetworkImage(backdropPath!)),
            description: movies[index].overview ?? '',
          ),
        );
      },
    );
  }

  Widget _buildPopularMoviesSliver() {
    // TODO: Implement movie card
    final movieCubit = context.watch<MovieCubit>();
    return GridView.count(
      padding: context.padding.horizontalNormal,
      crossAxisCount: AdaptAllView.withT(
        context: context,
        defaultWidget: 1,
        phone: 2,
        tablet: 3,
        desktop: 4,
        fourK: 5,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.75,
      mainAxisSpacing: context.sized.normalValue,
      crossAxisSpacing: context.sized.normalValue,
      children: List.generate(
        movieCubit.state.popularMovies.length,
        (index) {
          final movie = movieCubit.state.popularMovies[index];
          final posterPath =
              movieCubit.state.popularMoviesPosterPaths[movie.id.toString()];
          return MovieCard(
            id: movie.id,
            onTap: (id) {},
            title: movie.title ?? '',
            image: posterPath.nullOr(NetworkImage(posterPath!)),
            description: movie.overview ?? '',
          );
        },
      ),
    ).ext.toVisible(value: movieCubit.state.popularMovies.isNotEmpty);
  }
}
