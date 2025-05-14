import 'package:flutter/material.dart';

import '../../../../../../core/utils/formatters/currency_format.dart';
import '../../../../../../core/widgets/decorations/card_decoration.dart';

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({
    required this.totalAmount,
    required this.productCount,
    super.key,
  });

  final double? totalAmount;
  final int productCount;

  @override
  Widget build(BuildContext context) {
    return CardDecoration(
      child: Column(
        spacing: 12,
        children: [
          _BuildInfoRow(
            label: 'Товары, $productCount шт.',
            value: currencyFormat.format(totalAmount),
          ),
          _BuildInfoRow(
            label: 'Скидка',
            value: currencyFormat.format(0),
          ),
          const Divider(
            height: 8,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Итого к оплате',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (totalAmount != null)
                Text(
                  currencyFormat.format(totalAmount),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildInfoRow extends StatelessWidget {
  const _BuildInfoRow({
    required this.label,
    required this.value,
  });

  final String label;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xffCECFD2),
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
