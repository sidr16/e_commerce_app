import 'package:flutter/material.dart';

import '../../utils/extensions/context_extensions.dart';

class CardDecoration extends StatelessWidget {
  const CardDecoration({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }
}
