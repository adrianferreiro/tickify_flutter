import 'package:go_router/go_router.dart';
import 'package:tickify_flutter/features/splash/presentation/pages/splash_screen.dart';
import 'package:tickify_flutter/features/validator/presentation/screens/screens.dart';

class AppRouter {
  static final GoRouter _routes = GoRouter(
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        name: SplashScreen.name,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: ValidatorScreen.path,
        name: ValidatorScreen.name,
        builder: (_, __) => const ValidatorScreen(),
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
