import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view.dart';
import 'package:flutter_movie_app/presentation/views/explore/explore_view.dart';
import 'package:flutter_movie_app/presentation/views/home/home_view.dart';
import 'package:flutter_movie_app/presentation/views/root/root_view.dart';

part 'app_router.gr.dart';

/// Project router information class
@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends _$AppRouter implements AutoRouteGuard {
  static const _replaceRouteName = 'View,Route';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/splash', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/', page: RootRoute.page),
        AutoRoute(path: '/home', page: HomeRoute.page),
        AutoRoute(path: '/explore', page: ExploreRoute.page),
      ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    resolver.next();
  }
}
