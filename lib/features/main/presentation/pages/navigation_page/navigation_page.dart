import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/app_navigation_bar.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: AppNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
