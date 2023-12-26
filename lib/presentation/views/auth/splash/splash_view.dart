import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/base/base_view_state.dart';
import 'package:flutter_movie_app/app/init/navigation/app_router.dart';
import 'package:flutter_movie_app/presentation/bloc/movie/movie_cubit.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/cubit/splash_view_cubit.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/widgets/splash_logo.dart';

part 'splash_view_mixin.dart';

/// [SplashView] is the first view that will be shown to the user
@RoutePage()
class SplashView extends StatefulWidget {
  /// [SplashView] constructor
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseViewState<SplashView>
    with SplashViewMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashViewCubit>(
      create: (_) => splashViewCubit,
      child: const Scaffold(
        body: Center(
          child: SplashLogo(),
        ),
      ),
    );
  }
}
