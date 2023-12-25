part of 'root_view.dart';

/// [RootViewMixin] holds the state for home screen.
mixin RootViewMixin on BaseViewState<RootView>
    implements FunctionDurationMixin, SingleTickerProviderStateMixin<RootView> {
  /// [RootViewCubit] is the business logic and state.
  late final RootViewCubit rootViewCubit;

  /// [rootPageController] is the page controller for the page view.
  final PageController rootPageController = PageController();

  @override
  void initState() {
    super.initState();
    rootViewCubit = RootViewCubit();
  }

  @override
  void dispose() {
    rootViewCubit.close();
    super.dispose();
  }

  /// [onSelectedTab] is called when a tab is selected
  /// by tapping on the tab.
  void onSelectedTab(RootTabs currentTab) {
    rootPageController.animateToPage(
      currentTab.index,
      duration: context.duration.durationLow,
      curve: Curves.easeInOut,
    );
    rootViewCubit.changeTab(currentTab);
  }

  /// [onChangedTab] is called when a tab is changed
  /// by swiping the page view.
  void onChangedTab(int index) {
    final currentTab = RootTabs.values[index];
    rootViewCubit.changeTab(currentTab);
  }
}
