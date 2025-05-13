import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        ),
      ),
    );
  }
}
