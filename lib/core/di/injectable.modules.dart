import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/cart/data/models/cart_product_model/cart_product_model.dart';
import '../constants/endpoints.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Box<CartProductModel>> cartBox() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter<CartProductModel>(CartProductModelAdapter());
    return Hive.openBox<CartProductModel>('cartBox');
  }

  @lazySingleton
  Dio dioClient() => Dio(BaseOptions(baseUrl: Endpoints.baseUrl))
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          maxStale: const Duration(minutes: 15),
        ),
      ),
    );
}
