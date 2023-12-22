part of 'splash_view_cubit.dart';

/// [SplashViewState] is a class for managing the state of the splash screen.
final class SplashViewState extends BaseBlocState {
  /// [SplashViewState] constructor.
  SplashViewState({
    this.isBusy = true,
  });

  /// [isBusy] is a state when the splash screen is busy.
  final bool? isBusy;

  @override
  List<Object?> get props => [isBusy];

  /// [copyWith] is a method to copy the current object
  /// and change its properties.
  SplashViewState copyWith({
    bool? isBusy,
  }) {
    return SplashViewState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
