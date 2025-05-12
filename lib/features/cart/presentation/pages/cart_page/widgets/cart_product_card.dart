import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/extensions/context_extensions.dart';
import '../../../../../../core/widgets/buttons/primary_tonal_icon_button.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    const imageSize = 56.0;

    return Row(
      spacing: 8,
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12),
          ),
          child: CachedNetworkImage(
            imageUrl:
                'https://static.vecteezy.com/system/resources/previews/054/656/158/non_2x/glass-of-fresh-lemon-juice-free-png.png',
          ),
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pepsi 0,33 л',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                '16 000 монет',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Row(
          spacing: 4,
          children: [
            PrimaryTonalIconButton(
              iconPath: AppIcons.minus,
              onPressed: () {},
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 30,
              ),
              child: const Text(
                '1',
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            PrimaryTonalIconButton(
              iconPath: AppIcons.plus,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
