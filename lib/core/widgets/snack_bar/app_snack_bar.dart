import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/app_router_endpoints.dart';
import '../../utils/extensions/context_extensions.dart';

class AppSnackBar {
  AppSnackBar(this.context);

  final BuildContext context;

  SnackBar _buildSnackBar(String message) => SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: context.colorScheme.primary,
          ),
        ),
        backgroundColor: context.colorScheme.surface,
        action: SnackBarAction(
          label: 'Open cart',
          onPressed: () {
            if (context.canPop()) context.pop();
            context.pushNamed(RouterEndpoints.cart.name);
          },
        ),
      );

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackBar(message),
    );
  }
}
