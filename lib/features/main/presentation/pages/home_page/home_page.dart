import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'widgets/home_tab_list.dart';
import 'widgets/home_tab_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  final _scrollController = ScrollController();
  int _currentPage = 0;

  void _pageEventListener() {
    final page = _pageController.page?.round();

    if (page != null && page != _currentPage) {
      _currentPage = page;

      setState(() {});
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
      body: NestedScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, _) {
          return [
            SliverAppBar(
              surfaceTintColor: Colors.transparent,
              backgroundColor: const Color(0x1a000000),
              foregroundColor: Colors.black,
              expandedHeight: 300,
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                  ),
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://static.vecteezy.com/system/resources/previews/054/656/158/non_2x/glass-of-fresh-lemon-juice-free-png.png',
                      ),
                    ),
                  ),
                ),
              ),
              pinned: true,
              leadingWidth: double.infinity,
              leading: HomeTabList(
                currentPage: _currentPage,
                pageController: _pageController,
              ),
            ),
          ];
        },
        body: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return const HomeTabScreen();
          },
        ),
      ),
    );
  }
}
