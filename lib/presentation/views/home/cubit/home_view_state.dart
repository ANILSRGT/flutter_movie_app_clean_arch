part of 'home_view_cubit.dart';

/// [HomeViewState] is a class for managing the state of the home screen.
final class HomeViewState extends BaseBlocState {
  /// [HomeViewState] constructor.
  HomeViewState({
    this.isBusy = true,
  });

  /// [isBusy] is a state when the home screen is busy.
  final bool? isBusy;

  @override
  List<Object?> get props => [isBusy];

  /// [copyWith] is a method to copy the current object
  /// and change its properties.
  HomeViewState copyWith({
    bool? isBusy,
  }) {
    return HomeViewState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
