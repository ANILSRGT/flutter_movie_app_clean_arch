part of 'root_view_cubit.dart';

/// [RootViewState] is a class for managing the state of the root screen.
final class RootViewState extends BaseBlocState {
  /// [RootViewState] constructor.
  RootViewState({
    this.isBusy = true,
  });

  /// [isBusy] is a state when the root screen is busy.
  final bool? isBusy;

  @override
  List<Object?> get props => [isBusy];

  /// [copyWith] is a method to copy the current object
  /// and change its properties.
  RootViewState copyWith({
    bool? isBusy,
  }) {
    return RootViewState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
