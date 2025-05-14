import 'package:flutter/material.dart';

import '../svg/svg_asset.dart';

class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({
    required this.title,
    this.iconPath,
    this.onPressed,
    super.key,
  });

  final String title;
  final String? iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: FilledButton.icon(
        onPressed: onPressed,
        label: Text(title),
        icon: iconPath != null ? SvgAsset(iconPath!) : null,
      ),
    );
  }
}
