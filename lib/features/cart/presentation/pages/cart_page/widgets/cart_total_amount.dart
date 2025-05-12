import 'package:flutter/material.dart';

import '../../../../../../core/widgets/decorations/card_decoration.dart';

class CartTotalAmount extends StatelessWidget {
  const CartTotalAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardDecoration(
      child: Column(
        spacing: 12,
        children: [
          _BuildInfoRow(),
          _BuildInfoRow(),
          Divider(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Итого к оплате',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '41 000 монет',
                style: TextStyle(
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
  const _BuildInfoRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Text(
            'Товары, 3 шт.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xffCECFD2),
            ),
          ),
        ),
        Text(
          '41 000 монет',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
