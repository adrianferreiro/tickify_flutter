import 'package:go_router/go_router.dart';
import 'package:tickify_flutter/features/splash/presentation/pages/splash_screen.dart';
import 'package:tickify_flutter/main.dart';

class AppRouter {
  static final GoRouter _routes = GoRouter(
    initialLocation: '/splash_page',
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: ExampleHome.path,
        name: ExampleHome.name,
        builder: (_, __) => const ExampleHome(),
        routes: [
          // GoRoute(
          //   path: PokemonDetailPage.routePath,
          //   name: PokemonDetailPage.routeName,
          //   builder: (_, state) => PokemonDetailPage(),
          // ),
        ],
      ),
    ],
  );

  /// Router Getter
  static GoRouter get routes => _routes;
}
