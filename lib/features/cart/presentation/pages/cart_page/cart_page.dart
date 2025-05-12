import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/buttons/primary_filled_button.dart';
import '../../../../../core/widgets/svg/svg_asset.dart';
import 'widgets/cart_product_list.dart';
import 'widgets/cart_total_amount.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const SvgAsset(
              AppIcons.trash,
            ),
          ),
          const Gap(4),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PrimaryFilledButton(
            title: 'Оформить заказ',
            onPressed: () {},
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            CartProductList(),
            CartTotalAmount(),
          ],
        ),
      ),
    );
  }
}
