import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:injectable/injectable.dart';

import '../constants/endpoints.dart';

@module
abstract class RegisterModule {
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
