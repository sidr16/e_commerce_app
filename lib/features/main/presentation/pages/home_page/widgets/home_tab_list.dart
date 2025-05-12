import 'package:flutter/material.dart';

import '../../../../../../core/widgets/buttons/primary_tab_button.dart';

class HomeTabList extends StatelessWidget {
  const HomeTabList({
    required this.pageController,
    required this.currentPage,
    super.key,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return PrimaryTabButton(
            title: 'Энергетики',
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
        itemCount: 10,
      ),
    );
  }
}
