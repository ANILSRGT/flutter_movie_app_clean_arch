import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view_state_mixin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [SplashView] is the first view that will be shown to the user
@RoutePage()
class SplashView extends ConsumerStatefulWidget {
  /// [SplashView] constructor
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView>
    with SplashViewStateMixin, FunctionDurationMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
