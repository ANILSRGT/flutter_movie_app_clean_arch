part of 'splash_view.dart';

/// [SplashViewMixin] holds the state for splash screen.
mixin SplashViewMixin on State<SplashView> implements FunctionDurationMixin {
  /// [SplashViewCubit] is the business logic and state.
  late final SplashViewCubit splashViewCubit;

  @override
  void initState() {
    super.initState();
    splashViewCubit = SplashViewCubit();
    _initSplash();
  }

  @override
  void dispose() {
    splashViewCubit.close();
    super.dispose();
  }

  Future<void> _initSplash() async {
    splashViewCubit.changeBusy(true);

    final elapsedMs = await waitOperation(() async {
      // TODO: Add your initialization code here
    });

    final remainingMs = 2000 - elapsedMs;

    if (remainingMs > 0) await remainingMs.waitMS;

    await waitOperation(() async {
      await context.router.replaceAll([const RootRoute()]);
    });

    splashViewCubit.changeBusy(false);
  }
}
