import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:routing_sample/main.dart';
import 'package:routing_sample/pages/home_page.dart';
import 'package:routing_sample/pages/main_page.dart';
import 'package:routing_sample/pages/start_page.dart';
import 'package:routing_sample/pages/term_page.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) => GoRouter(
      initialLocation: MainPage.pagePath,
      routes: $appRoutes,
      redirect: (context, state) async {
        final shouldShowTerms =
            ref.read(sharedPreferenceProvider).getBool("shouldShowTerms") ??
                true;

        // 仮のログイン情報
        final isLoggedIn =
            ref.read(sharedPreferenceProvider).getBool("isLoggedIn") ?? false;

        // 利用規約画面を表示するかどうか
        if (shouldShowTerms) {
          return TermsPage.pagePath;
        }

        // ログイン済みかどうか
        if (isLoggedIn) {
          return MainPage.pagePath + HomePage.pagePath;
        } else {
          return MainPage.pagePath + StartPage.pagePath;
        }
      },
    );

@TypedGoRoute<TermsRoute>(
  path: TermsPage.pagePath,
)
class TermsRoute extends GoRouteData {
  const TermsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const TermsPage();
}

@TypedGoRoute<MainRoute>(
  path: MainPage.pagePath,
  routes: [
    // ログイン前のルート
    TypedGoRoute<StartRoute>(
      path: StartPage.pagePath,
    ),
    // ログイン後のルート
    TypedGoRoute<HomeRoute>(
      path: HomePage.pagePath,
    )
  ],
)
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainPage();
  }
}

class StartRoute extends GoRouteData {
  const StartRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const StartPage();
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
