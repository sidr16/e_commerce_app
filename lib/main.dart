import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injectable.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/main/presentation/bloc/product_category_list_bloc/product_category_list_bloc.dart';

Future<void> main() async {
  await ServiceLocator.configureDependencies();

  runApp(
    BlocProvider(
      create: (context) => getIt<ProductCategoryListBloc>()..fetchData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;

    return MaterialApp.router(
      title: 'E-commerce app',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
