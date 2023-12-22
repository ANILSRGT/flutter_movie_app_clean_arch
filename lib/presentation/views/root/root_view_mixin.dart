part of 'root_view.dart';

/// [RootViewMixin] holds the state for root screen.
mixin RootViewMixin on BaseViewState<RootView>
    implements FunctionDurationMixin {
  /// [RootViewCubit] is the business logic and state.
  late final RootViewCubit rootViewCubit;

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

  /// [onSelectedTab] is called when a tab is selected.
  void onSelectedTab(RootTabs currentTab) {
    rootViewCubit.changeTab(currentTab);
  }
}
