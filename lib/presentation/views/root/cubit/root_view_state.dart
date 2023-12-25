part of 'root_view_cubit.dart';

/// [RootViewState] is a class for managing the state of the root screen.
class RootViewState extends BaseBlocState {
  /// [RootViewState] constructor.
  RootViewState({
    this.isBusy = true,
    this.currentTab = RootTabs.home,
  });

  /// [isBusy] is a state when the root screen is busy.
  final bool isBusy;

  /// [currentTab] is the current tab.
  final RootTabs currentTab;

  @override
  List<Object?> get props => [isBusy, currentTab];

  /// [copyWith] is a method to copy the current object
  /// and change its properties.
  RootViewState copyWith({
    bool? isBusy,
    RootTabs? currentTab,
  }) {
    return RootViewState(
      isBusy: isBusy ?? this.isBusy,
      currentTab: currentTab ?? this.currentTab,
    );
  }
}
