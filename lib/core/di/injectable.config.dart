// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce_app/core/client/dio_client.dart' as _i578;
import 'package:e_commerce_app/core/router/app_router.dart' as _i56;
import 'package:e_commerce_app/features/main/data/data_sources/remote/product_data_source/product_data_source.dart'
    as _i657;
import 'package:e_commerce_app/features/main/data/data_sources/remote/product_data_source/product_data_source_impl.dart'
    as _i750;
import 'package:e_commerce_app/features/main/data/repositories/product_repository_impl/product_repository_impl.dart'
    as _i843;
import 'package:e_commerce_app/features/main/domain/repositories/product_repository/product_repository.dart'
    as _i577;
import 'package:e_commerce_app/features/main/domain/use_cases/fetch_product_category_list_use_case.dart'
    as _i553;
import 'package:e_commerce_app/features/main/domain/use_cases/fetch_product_detail_use_case.dart'
    as _i162;
import 'package:e_commerce_app/features/main/domain/use_cases/fetch_product_list_use_case.dart'
    as _i193;
import 'package:e_commerce_app/features/main/presentation/bloc/product_category_list_bloc/product_category_list_bloc.dart'
    as _i410;
import 'package:e_commerce_app/features/main/presentation/bloc/product_detail_bloc/product_detail_bloc.dart'
    as _i578;
import 'package:e_commerce_app/features/main/presentation/bloc/product_list_bloc/product_list_bloc.dart'
    as _i384;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dioClient());
    gh.lazySingleton<_i56.AppRouter>(() => _i56.AppRouter());
    gh.singleton<_i657.ProductDataSource>(
        () => _i750.ProductDataSourceImpl(gh<_i361.Dio>()));
    gh.singleton<_i577.ProductRepository>(
        () => _i843.ProductRepositoryImpl(gh<_i657.ProductDataSource>()));
    gh.factory<_i553.FetchProductCategoryListUseCase>(() =>
        _i553.FetchProductCategoryListUseCase(gh<_i577.ProductRepository>()));
    gh.factory<_i193.FetchProductListUseCase>(
        () => _i193.FetchProductListUseCase(gh<_i577.ProductRepository>()));
    gh.factory<_i162.FetchProductDetailUseCase>(
        () => _i162.FetchProductDetailUseCase(gh<_i577.ProductRepository>()));
    gh.factory<_i410.ProductCategoryListBloc>(() =>
        _i410.ProductCategoryListBloc(
            gh<_i553.FetchProductCategoryListUseCase>()));
    gh.factory<_i578.ProductDetailBloc>(
        () => _i578.ProductDetailBloc(gh<_i162.FetchProductDetailUseCase>()));
    gh.factory<_i384.ProductListBloc>(
        () => _i384.ProductListBloc(gh<_i193.FetchProductListUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i578.RegisterModule {}
