part of 'explore_view.dart';

/// [ExploreViewMixin] holds the state for explore screen.
mixin ExploreViewMixin on BaseViewState<ExploreView>
    implements FunctionDurationMixin {
  /// [ExploreViewCubit] is the business logic and state.
  late final ExploreViewCubit exploreViewCubit;

  /// [scrollController] is the scroll controller for the screen.
  final ScrollController scrollController = ScrollController();

  /// [isScrolled] is the notifier for the scroll controller.
  final ValueNotifier<bool> isScrolled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    exploreViewCubit = ExploreViewCubit();
    scrollController.addListener(() {
      isScrolled.value =
          scrollController.offset > context.sized.dynamicHeight(0.3);
    });
  }

  @override
  void dispose() {
    exploreViewCubit.close();
    super.dispose();
  }

  /// [jumpToTop] is the function to jump to top of the screen.
  void jumpToTop() {
    scrollController.animateTo(
      0,
      duration: context.duration.durationLow,
      curve: Curves.easeIn,
    );
  }
}
