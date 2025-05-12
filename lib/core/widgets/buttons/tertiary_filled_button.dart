import 'package:flutter/material.dart';

import '../svg/svg_asset.dart';

class TertiaryFilledButton extends StatelessWidget {
  const TertiaryFilledButton({
    required this.title,
    this.iconPath,
    this.width,
    this.onTap,
    super.key,
  });

  final String title;
  final double? width;
  final String? iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: width,
      child: FilledButton.icon(
        onPressed: onTap,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(Color(0x33000000)),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 12,
            ),
          ),
        ),
        icon: iconPath != null ? SvgAsset(iconPath!) : null,
        label: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
