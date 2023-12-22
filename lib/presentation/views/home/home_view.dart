import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/presentation/views/home/cubit/home_view_cubit.dart';

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
      child: const Scaffold(
        body: Center(
          child: Text('HomeView'),
        ),
      ),
    );
  }
}
