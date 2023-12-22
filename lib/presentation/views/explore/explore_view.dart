import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/presentation/views/explore/cubit/explore_view_cubit.dart';

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
      child: const Scaffold(
        body: Center(
          child: Text('ExploreView'),
        ),
      ),
    );
  }
}
