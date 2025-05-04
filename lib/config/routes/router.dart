import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _routes = GoRouter(
    initialLocation: '/splash_page',
    routes: [
      // GoRoute(
      //   path: SplashPage.routePath,
      //   name: SplashPage.routeName,
      //   builder: (_, __) => const SplashPage(),
      // ),
      // GoRoute(
      //   path: HomePage.routePath,
      //   name: HomePage.routeName,
      //   builder: (_, __) => const HomePage(),
      //   routes: [
      //     // GoRoute(
      //     //   path: PokemonDetailPage.routePath,
      //     //   name: PokemonDetailPage.routeName,
      //     //   builder: (_, state) => PokemonDetailPage(),
      //     // ),
      //   ],
      // ),
    ],
  );

  /// Router Getter
  static GoRouter get routes => _routes;
}
