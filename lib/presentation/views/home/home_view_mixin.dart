part of 'home_view.dart';

/// [HomeViewMixin] holds the state for home screen.
mixin HomeViewMixin on BaseViewState<HomeView>
    implements FunctionDurationMixin {
  /// [HomeViewCubit] is the business logic and state.
  late final HomeViewCubit homeViewCubit;

  @override
  void initState() {
    super.initState();
    homeViewCubit = HomeViewCubit();

    _onRefresh();
  }

  @override
  void dispose() {
    homeViewCubit.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      _initPopularMovies(),
    ]);
  }

  Future<void> _initPopularMovies() async {
    await context.read<MovieCubit>().fetchPopularMovies();
  }
}
