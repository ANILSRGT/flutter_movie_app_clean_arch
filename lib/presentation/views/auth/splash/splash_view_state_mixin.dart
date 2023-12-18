import 'package:core/core.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_provider.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_state.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [SplashViewStateMixin] holds the state for [SplashView]
mixin SplashViewStateMixin on ConsumerState<SplashView>
    implements FunctionDurationMixin {
  /// [SplashProvider] holds the state for [SplashView]
  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>(
    (ref) => SplashProvider(),
  );

  /// [refRead] is a [SplashProvider] instance
  /// that can be used to read the state
  SplashProvider get refRead =>
      ref.read<SplashProvider>(splashProvider.notifier);

  /// [refWatch] is a [SplashProvider] instance
  /// that can be used to watch the state
  /// and rebuild the widget when the state changes
  SplashProvider get refWatch =>
      ref.watch<SplashProvider>(splashProvider.notifier);

  @override
  void initState() {
    super.initState();
    _initSplash();
  }

  Future<void> _initSplash() async {
    refRead.changeBusy(true);

    final elapsedMs = await waitOperation(() async {
      // TODO: Add your initialization code here
    });

    final remainingMs = 2000 - elapsedMs;

    if (remainingMs > 0) await remainingMs.waitMS;

    refRead.changeBusy(false);
  }
}
