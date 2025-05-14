import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/utils/extensions/context_extensions.dart';
import '../../../../../../core/widgets/svg/svg_asset.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
    );

    const blurSigma = 40.0;

    final activeColor = context.colorScheme.primary;
    const inActiveColor = Color(0xb28B9099);

    final currentIndex = navigationShell.currentIndex;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurSigma,
          sigmaY: blurSigma,
        ),
        child: BottomNavigationBar(
          unselectedLabelStyle: labelStyle,
          selectedLabelStyle: labelStyle.copyWith(
            color: activeColor,
          ),
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: (value) {
            navigationShell.goBranch(
              value,
              initialLocation: value == currentIndex,
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0x33FFFFFF),
          unselectedItemColor: inActiveColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: const SvgAsset(
                AppIcons.home,
                color: inActiveColor,
              ),
              activeIcon: SvgAsset(
                AppIcons.home,
                color: activeColor,
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: const SvgAsset(
                AppIcons.food,
                color: inActiveColor,
              ),
              activeIcon: SvgAsset(
                AppIcons.food,
                color: activeColor,
              ),
              label: 'Еда',
            ),
            BottomNavigationBarItem(
              icon: const SvgAsset(
                AppIcons.qrCode,
                color: inActiveColor,
              ),
              activeIcon: SvgAsset(
                AppIcons.qrCode,
                color: activeColor,
              ),
              label: 'QR код',
            ),
            BottomNavigationBarItem(
              icon: const SvgAsset(
                AppIcons.menu,
                color: inActiveColor,
              ),
              activeIcon: SvgAsset(
                AppIcons.menu,
                color: activeColor,
              ),
              label: 'Меню',
            ),
          ],
        ),
      ),
    );
  }
}
