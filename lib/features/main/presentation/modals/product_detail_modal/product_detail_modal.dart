import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/di/injectable.dart';
import '../../../../../core/utils/extensions/context_extensions.dart';
import '../../../../../core/widgets/buttons/primary_filled_button.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../bloc/product_detail_bloc/product_detail_bloc.dart';
import '../../bloc/product_detail_bloc/product_detail_state.dart';

Future<void> showProductModal(
  BuildContext context, {
  required String id,
}) async {
  return CupertinoScaffold.showCupertinoModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: const Color(0xffF5F5F5),
    builder: (context) {
      return BlocProvider(
        create: (BuildContext context) =>
            getIt<ProductDetailBloc>()..fetchData(id),
        child: const ProductDetailModal(),
      );
    },
  );
}

class ProductDetailModal extends StatelessWidget {
  const ProductDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = context.watch<ProductDetailBloc>();

    return switch (detail.state) {
      final ProductDetailDataState data =>
        _BuildDetail(data.product).animate().fade(),
      ProductDetailLoadingState _ => const Center(
          child: CircularProgressIndicator(),
        ),
      final ProductDetailErrorState data => Center(
          child: Text(data.error.toString()),
        )
    };
  }
}

class _BuildDetail extends StatelessWidget {
  const _BuildDetail(this.product);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final strInstructions = product.strInstructions;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          product.name,
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
        child: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: product.thumbUrl,
            ),
            const Gap(16),
            if (strInstructions != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  strInstructions,
                  style: TextStyle(
                    color: context.colorScheme.onSecondary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
