import 'package:flutter_movie_app/presentation/views/auth/splash/splash_state.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [SplashProvider] holds the state for [SplashView]
final class SplashProvider extends StateNotifier<SplashState> {
  /// [SplashProvider] constructor
  SplashProvider() : super(const SplashState());

  /// [changeBusy] changes the state of [isBusy]
  void changeBusy(bool isBusy) {
    state = state.copyWith(isBusy: isBusy);
  }
}
