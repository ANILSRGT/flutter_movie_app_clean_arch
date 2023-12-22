part of 'explore_view.dart';

/// [ExploreViewMixin] holds the state for explore screen.
mixin ExploreViewMixin on BaseViewState<ExploreView>
    implements FunctionDurationMixin {
  /// [ExploreViewCubit] is the business logic and state.
  late final ExploreViewCubit exploreViewCubit;

  @override
  void initState() {
    super.initState();
    exploreViewCubit = ExploreViewCubit();
  }

  @override
  void dispose() {
    exploreViewCubit.close();
    super.dispose();
  }
}
