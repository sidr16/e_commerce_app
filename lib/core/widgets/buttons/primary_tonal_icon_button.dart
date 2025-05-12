import 'package:flutter/material.dart';

import '../../utils/extensions/context_extensions.dart';
import '../svg/svg_asset.dart';

class PrimaryTonalIconButton extends StatelessWidget {
  const PrimaryTonalIconButton({
    required this.iconPath,
    this.onPressed,
    super.key,
  });

  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton.filledTonal(
        onPressed: onPressed,
        icon: SvgAsset(iconPath),
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            context.colorScheme.surfaceContainerHigh,
          ),
        ),
      ),
    );
  }
}
