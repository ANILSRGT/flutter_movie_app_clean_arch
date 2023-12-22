import 'package:common/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/app_container.dart';
import 'package:flutter_movie_app/app/app_init.dart';
import 'package:flutter_movie_app/app/init/localization/app_locale_manager.dart';
import 'package:flutter_movie_app/app/init/navigation/app_router.dart';
import 'package:flutter_movie_app/app/providers/provider_list.dart';
import 'package:flutter_movie_app/app/providers/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInit.setup();
  runApp(AppLocaleManager(child: const _MainApp()));
}

class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    final appRouter = AppContainer.read<AppRouter>();
    final toaster = AppContainer.read<PToaster>();
    return MultiProvider(
      providers: ProviderList().providers,
      child: Builder(
        builder: (rootContext) {
          final themeManager = rootContext.watch<ThemeNotifier>();
          return SafeArea(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routeInformationParser:
                  appRouter.defaultRouteParser(includePrefixMatches: true),
              routerDelegate: appRouter.delegate(
                navigatorObservers: () => [toaster.toast.observer],
              ),
              builder: (ctx, child) {
                child = CustomResponsive.build(ctx, child);
                child = toaster.toast.build(ctx, child);
                return child;
              },
              theme: themeManager.currentTheme.themeInfo(true).themeData,
              darkTheme: themeManager.currentTheme.themeInfo(false).themeData,
              themeMode: themeManager.currentThemeMode,
              localizationsDelegates: rootContext.localizationDelegates,
              supportedLocales: rootContext.supportedLocales,
              locale: rootContext.locale,
            ),
          );
        },
      ),
    );
  }
}
