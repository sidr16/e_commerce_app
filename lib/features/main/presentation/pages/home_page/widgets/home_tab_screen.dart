import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/constants/app_font_family.dart';
import '../../../../../../core/di/injectable.dart';
import '../../../../../../core/widgets/cards/product_card.dart';
import '../../../../domain/entities/category_entity/category_entity.dart';
import '../../../../domain/entities/product_entity/product_entity.dart';
import '../../../bloc/product_list_bloc/product_list_bloc.dart';
import '../../../bloc/product_list_bloc/product_list_state.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({
    required this.category,
    super.key,
  });

  final CategoryEntity category;

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (BuildContext context) =>
          getIt<ProductListBloc>()..fetchData(widget.category),
      child: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          return switch (state) {
            final ProductListDataState data => _BuildProductsScreen(
                products: data.products,
                category: widget.category,
              ).animate().fade(),
            ProductListLoadingState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            final ProductListErrorState data => Center(
                child: Text(data.error.toString()),
              )
          };
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BuildProductsScreen extends StatelessWidget {
  const _BuildProductsScreen({
    required this.products,
    required this.category,
  });

  final CategoryEntity category;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const Text('No Data');

    final firstProduct = products[0];

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 0,
            expandedHeight: 300,
            backgroundColor: Colors.transparent,
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ClipRRect(
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: firstProduct.thumbUrl,
                ),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(
          slivers: [
            const SliverGap(16),
            SliverToBoxAdapter(
              child: Text(
                category.name,
                style: const TextStyle(
                  fontFamily: AppFontFamily.akrobat,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            const SliverGap(16),
            SliverSafeArea(
              top: false,
              sliver: SliverGrid.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  maxCrossAxisExtent: 236,
                  childAspectRatio: 165 / 236,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
            ),
            const SliverGap(16),
          ],
        ),
      ),
    );
  }
}
