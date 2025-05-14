import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';

import '../../../../../../core/widgets/decorations/card_decoration.dart';
import '../../../../domain/entities/cart_product_entity.dart';
import 'cart_product_card.dart';

class CartProductList extends StatelessWidget {
  const CartProductList({
    required this.products,
    super.key,
  });

  final List<CartProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return CardDecoration(
      child: SeparatedColumn(
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 32,
          );
        },
        children: products.map((item) {
          return CartProductCard(
            product: item,
          );
        }).toList(),
      ),
    );
  }
}
