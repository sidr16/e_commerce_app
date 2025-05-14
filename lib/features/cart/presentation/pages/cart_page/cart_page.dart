import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/widgets/buttons/primary_filled_button.dart';
import '../../../../../core/widgets/dialog/question_dialog.dart';
import '../../../../../core/widgets/svg/svg_asset.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../bloc/cart_bloc/cart_event.dart';
import '../../bloc/cart_bloc/cart_state.dart';
import 'widgets/cart_empty_data.dart';
import 'widgets/cart_product_list.dart';
import 'widgets/cart_total_amount.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>();
    var cartIsEmpty = false;

    final state = cart.state;

    if (state is CartDataState) {
      cartIsEmpty = state.products.isEmpty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        actions: [
          if (!cartIsEmpty)
            IconButton(
              onPressed: () {
                showQuestionDialog(
                  context,
                  title: 'Очистить корзину',
                  description: 'Вы уверены, что хотите очистить корзину?',
                  onAccept: () {
                    cart.add(CleanCartEvent());
                  },
                );
              },
              icon: const SvgAsset(
                AppIcons.trash,
              ),
            ),
          const Gap(4),
        ],
      ),
      bottomNavigationBar: cartIsEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: PrimaryFilledButton(
                  title: 'Оформить заказ',
                  onPressed: () {},
                ),
              ),
            ),
      body: switch (state) {
        CartLoadingState _ => const Center(
            child: CircularProgressIndicator(),
          ),
        final CartDataState data => data.products.isEmpty
            ? const CartEmptyData()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    CartProductList(
                      products: data.products,
                    ),
                    CartTotalAmount(
                      totalAmount: cart.getAllProductFinalPrice(),
                      productCount: data.products.length,
                    ),
                  ],
                ),
              ).animate().fade(),
        final CartErrorState data => Center(
            child: Text(data.error.toString()),
          ),
      },
    );
  }
}
