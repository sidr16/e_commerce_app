import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/cart/presentation/pages/cart_page/cart_page.dart';
import '../../features/main/presentation/pages/home_page/home_page.dart';
import '../../features/main/presentation/pages/navigation_page/navigation_page.dart';
import 'app_router_endpoints.dart';

@lazySingleton
class AppRouter {
  late final router = GoRouter(
    routes: routes,
    initialLocation: RouterEndpoints.meal.path,
  );

  final routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationPage(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterEndpoints.home.path,
              name: RouterEndpoints.home.name,
              builder: (context, state) => const CartPage(),
              routes: [
                GoRoute(
                  path: RouterEndpoints.cart.path,
                  name: RouterEndpoints.cart.name,
                  builder: (context, state) => const CartPage(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: RouterEndpoints.meal.path,
              name: RouterEndpoints.meal.name,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
      ],
    ),
  ];
}
