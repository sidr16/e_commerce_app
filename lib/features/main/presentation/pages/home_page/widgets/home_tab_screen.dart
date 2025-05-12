import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/app_font_family.dart';
import '../../../../../../core/widgets/cards/product_card.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverGap(16),
          const SliverToBoxAdapter(
            child: Text(
              'Фреш',
              style: TextStyle(
                fontFamily: AppFontFamily.akrobat,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SliverGap(16),
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              maxCrossAxisExtent: 236,
              childAspectRatio: 165 / 236,
            ),
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ],
      ),
    );
  }
}
