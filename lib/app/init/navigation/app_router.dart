import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_app/presentation/views/auth/splash/splash_view.dart';

part 'app_router.gr.dart';

/// Project router information class
@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends _$AppRouter implements AutoRouteGuard {
  static const _replaceRouteName = 'View,Route';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
      ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    resolver.next();
  }
}
