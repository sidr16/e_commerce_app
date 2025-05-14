class AppRouterEndpoint {
  const AppRouterEndpoint({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}

class RouterEndpoints {
  static const home = AppRouterEndpoint(
    name: 'Home',
    path: '/',
  );

  static const meal = AppRouterEndpoint(
    name: 'Meal',
    path: '/meal',
  );

  static const cart = AppRouterEndpoint(
    name: 'Cart',
    path: '/cart',
  );
}
