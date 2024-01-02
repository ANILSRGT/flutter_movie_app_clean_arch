import 'package:auto_route/auto_route.dart';
import 'package:common/core.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/presentation/views/explore/cubit/explore_view_cubit.dart';
import 'package:flutter_movie_app/presentation/widgets/movie/movie_card.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

part 'explore_view_mixin.dart';

/// [ExploreView] screen
@RoutePage()
class ExploreView extends StatefulWidget {
  /// [ExploreView] constructor
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends BaseViewState<ExploreView>
    with ExploreViewMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreViewCubit>(
      create: (_) => exploreViewCubit,
      child: Scaffold(
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isScrolled,
          builder: (_, value, __) {
            return FloatingActionButton(
              onPressed: value ? jumpToTop : null,
              child: Icon(
                Icons.arrow_upward,
                color: context.general.colorScheme.onPrimary,
              ),
            ).ext.toVisible(value: value);
          },
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            _buildSearchSliverAppBar(),
            context.sized.emptySizedHeightBoxLow3x.ext.sliver,
            _genreTabs().ext.sliver,
            context.sized.emptySizedHeightBoxLow3x.ext.sliver,
            _movieListByGenre().ext.sliver,
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSearchSliverAppBar() {
    // TODO: Implement search sliver app bar
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      toolbarHeight: kToolbarHeight + context.padding.normal.top,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: context.padding.normal - context.padding.onlyBottomNormal,
        title: _searchBar(),
      ),
    );
  }

  Widget _searchBar() {
    // TODO: Implement search bar
    return SearchAnchor.bar(
      suggestionsBuilder: (_, searchController) async {
        return Future.value(
          List.generate(
            3,
            (index) => ListTile(
              title: Text('Suggestion $index'),
              onTap: () {
                searchController.text = 'Suggestion $index';
              },
            ),
          ),
        );
      },
    );
  }

  Widget _genreTabs() {
    // TODO: Implement genre tabs
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            10,
            (index) => Padding(
              padding: index == 0
                  ? context.padding.onlyLeftNormal
                  : index == 9
                      ? (context.padding.onlyRightNormal +
                          context.padding.onlyLeftLow)
                      : context.padding.onlyLeftLow,
              child: Chip(
                label: Text(
                  'Genre $index',
                  style: context.general.textTheme.bodyMedium,
                ),
                backgroundColor: index == 0
                    ? context.general.colorScheme.primary
                    : context.general.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _movieListByGenre() {
    // TODO: Implement movie card
    return LayoutBuilder(
      builder: (_, constraints) {
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
            20,
            (index) => MovieCard(
              id: index,
              onTap: (id) {},
              title: 'Movie $index',
              image: CustomCachedNetworkImage(
                imageUrl: ''.ext.randomSquareImage,
                placeholder: (_, __) => const Icon(Icons.image),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ).toProvider,
              description: 'Description $index',
            ),
          ),
        );
      },
    );
  }
}
