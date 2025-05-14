import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/cart/domain/entities/cart_product_entity.dart';
import '../../../features/cart/presentation/bloc/cart_bloc/cart_bloc.dart';
import '../../../features/cart/presentation/bloc/cart_bloc/cart_event.dart';
import '../../../features/main/domain/entities/product_entity/product_entity.dart';
import '../../../features/main/presentation/modals/product_detail_modal/product_detail_modal.dart';
import '../../constants/app_icons.dart';
import '../buttons/tertiary_filled_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    final cart = context.watch<CartBloc>();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          showProductModal(
            context,
            id: product.id,
          );
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: const Color(0x3D000000),
          ),
          child: Column(
            spacing: 8,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: borderRadius,
                  child: CachedNetworkImage(
                    imageUrl: product.thumbUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              TertiaryFilledButton(
                width: double.infinity,
                title: '10 000 монет',
                iconPath: AppIcons.plus,
                onTap: () {
                  cart.add(
                    AddCartProductEvent(
                      CartProductEntity(
                        idMeal: product.id,
                        strMeal: product.name,
                        strMealThumb: product.thumbUrl,
                        price: 10000,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
