import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view.dart';

/// [SplashState] holds the data for [SplashView]
final class SplashState extends Equatable {
  /// [SplashState] constructor
  const SplashState({
    this.isBusy,
  });

  /// [isBusy] indicates if the view is busy
  final bool? isBusy;

  @override
  List<Object?> get props => [isBusy];

  /// [copyWith] copies the current state with changes
  SplashState copyWith({
    bool? isBusy,
  }) {
    return SplashState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
