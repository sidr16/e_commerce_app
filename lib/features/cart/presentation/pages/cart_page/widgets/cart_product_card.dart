import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/extensions/context_extensions.dart';
import '../../../../../../core/utils/formatters/currency_format.dart';
import '../../../../../../core/widgets/buttons/primary_tonal_icon_button.dart';
import '../../../../domain/entities/cart_product_entity.dart';
import '../../../bloc/cart_bloc/cart_bloc.dart';
import '../../../bloc/cart_bloc/cart_event.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    required this.product,
    super.key,
  });

  final CartProductEntity product;

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartBloc>();

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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: product.strMealThumb,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.strMeal,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                currencyFormat.format(product.fullPrice),
                style: const TextStyle(
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
              onPressed: () {
                cart.add(
                  RemoveCartProductEvent(product.idMeal),
                );
              },
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 30,
              ),
              child: Text(
                product.quantity.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            PrimaryTonalIconButton(
              iconPath: AppIcons.plus,
              onPressed: () {
                cart.add(
                  AddCartProductEvent(product),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
