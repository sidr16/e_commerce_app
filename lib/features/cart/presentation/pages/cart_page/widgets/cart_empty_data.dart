import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartEmptyData extends StatelessWidget {
  const CartEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/no_data.png',
            width: 155,
          ),
          const Gap(16),
          const Text(
            'Список пуст',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(4),
          const Text(
            'У вас нет товаров в корзине',
            style: TextStyle(
              fontSize: 13,
              color: Color(0xff94969C),
            ),
          ),
        ],
      ),
    );
  }
}
