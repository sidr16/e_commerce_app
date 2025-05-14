import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_entity/category_entity.dart';
import '../../bloc/product_category_list_bloc/product_category_list_bloc.dart';
import '../../bloc/product_category_list_bloc/product_category_list_state.dart';
import 'widgets/home_tab_list.dart';
import 'widgets/home_tab_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<ProductCategoryListBloc>();

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xfff4e8de),
      body: switch (categories.state) {
        final ProductCategoryListDataState data =>
          _BuildHomePage(data.categories).animate().fade(),
        ProductCategoryListLoadingState _ => const Center(
            child: CircularProgressIndicator(),
          ),
        final ProductCategoryListErrorState data => Center(
            child: Text(
              data.error.toString(),
              style: const TextStyle(color: Colors.red),
            ),
          )
      },
    );
  }
}

class _BuildHomePage extends StatefulWidget {
  const _BuildHomePage(this.categories);

  final List<CategoryEntity> categories;

  @override
  State<_BuildHomePage> createState() => _BuildHomePageState();
}

class _BuildHomePageState extends State<_BuildHomePage> {
  final _pageController = PageController();
  final _scrollController = ScrollController();
  final _currentPage = ValueNotifier<int>(0);

  void _pageEventListener() {
    final page = _pageController.page?.round();

    if (page != null && page != _currentPage.value) {
      _currentPage.value = page;
    }
  }

  @override
  void initState() {
    super.initState();

    _pageController.addListener(_pageEventListener);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_pageEventListener)
      ..dispose();

    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const blurSigma = 56.0;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xfff4e8de),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0x1a000000),
        foregroundColor: Colors.black,
        leadingWidth: double.infinity,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigma,
              sigmaY: blurSigma,
            ),
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        leading: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (context, value, child) {
            return HomeTabList(
              currentPage: value,
              pageController: _pageController,
              categories: widget.categories,
            );
          },
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];

          return HomeTabScreen(
            category: category,
          );
        },
      ),
    );
  }
}
