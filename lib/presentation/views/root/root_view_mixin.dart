part of 'root_view.dart';

/// [RootViewMixin] holds the state for root screen.
mixin RootViewMixin on State<RootView> implements FunctionDurationMixin {
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
}
