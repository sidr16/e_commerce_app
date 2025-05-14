import 'package:flutter/material.dart';

import '../../../../../../core/widgets/buttons/primary_tab_button.dart';
import '../../../../domain/entities/category_entity/category_entity.dart';

class HomeTabList extends StatelessWidget {
  const HomeTabList({
    required this.pageController,
    required this.currentPage,
    required this.categories,
    super.key,
  });

  final int currentPage;
  final PageController pageController;
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];

          return PrimaryTabButton(
            title: category.name,
            selected: index == currentPage,
            onTap: () {
              pageController.animateToPage(
                index,
                duration: Durations.medium2,
                curve: Curves.ease,
              );
            },
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
