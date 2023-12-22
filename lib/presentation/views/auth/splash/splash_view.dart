import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/init/navigation/app_router.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/cubit/splash_view_cubit.dart';

part 'splash_view_mixin.dart';
part 'widgets/splash_logo.dart';

/// [SplashView] is the first view that will be shown to the user
@RoutePage()
class SplashView extends StatefulWidget {
  /// [SplashView] constructor
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SplashViewMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashViewCubit>(
      create: (_) => splashViewCubit,
      child: const Scaffold(
        body: Center(
          child: _SplashLogo(),
        ),
      ),
    );
  }
}
