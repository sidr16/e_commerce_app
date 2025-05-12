import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/utils/extensions/context_extensions.dart';
import '../../../../../core/widgets/buttons/primary_filled_button.dart';

Future<void> showProductModal(BuildContext context) async {
  return CupertinoScaffold.showCupertinoModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: const Color(0xffF5F5F5),
    builder: (context) {
      return const ProductDetailModal();
    },
  );
}

class ProductDetailModal extends StatelessWidget {
  const ProductDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          'Moxito Fresh',
          style: TextStyle(
            color: context.colorScheme.onSecondary,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PrimaryFilledButton(
            title: '24 000 монет',
            iconPath: AppIcons.plus,
            onPressed: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://static.vecteezy.com/system/resources/previews/054/656/158/non_2x/glass-of-fresh-lemon-juice-free-png.png',
              fit: BoxFit.contain,
            ),
            const Gap(16),
            Text(
              'Вкус и яркий аромат этого прохладительного напитка знакомы каждому! Его мягкие карамельные нотки, облако воздушной пены и веселый шепот пузырьков уже более ста лет популярны. Обладает бодрящим эффектом. Рекомендуется пить охлажденным. Сильногазированный безалкогольный ароматизированный напиток',
              style: TextStyle(
                color: context.colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
