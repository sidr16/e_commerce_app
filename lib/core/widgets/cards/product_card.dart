import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/app_icons.dart';
import '../buttons/tertiary_filled_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0x3D000000),
      ),
      child: Column(
        spacing: 8,
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl:
                  'https://static.vecteezy.com/system/resources/previews/054/656/158/non_2x/glass-of-fresh-lemon-juice-free-png.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 40,
            child: Text(
              'Laimon Fresh 0.33л',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          TertiaryFilledButton(
            width: double.infinity,
            title: '16 000 монет',
            iconPath: AppIcons.plus,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
