part of 'explore_view_cubit.dart';

/// [ExploreViewState] is a class for managing the state of the explore screen.
final class ExploreViewState extends BaseBlocState {
  /// [ExploreViewState] constructor.
  ExploreViewState({
    this.isBusy = true,
  });

  /// [isBusy] is a state when the explore screen is busy.
  final bool? isBusy;

  @override
  List<Object?> get props => [isBusy];

  /// [copyWith] is a method to copy the current object
  /// and change its properties.
  ExploreViewState copyWith({
    bool? isBusy,
  }) {
    return ExploreViewState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}
