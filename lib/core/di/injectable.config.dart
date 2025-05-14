// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce_app/core/di/injectable.modules.dart' as _i521;
import 'package:e_commerce_app/core/router/app_router.dart' as _i56;
import 'package:e_commerce_app/features/cart/data/data_sources/local/cart_data_source/cart_data_source.dart'
    as _i140;
import 'package:e_commerce_app/features/cart/data/data_sources/local/cart_data_source/cart_data_source_impl.dart'
    as _i1045;
import 'package:e_commerce_app/features/cart/data/models/cart_product_model/cart_product_model.dart'
    as _i52;
import 'package:e_commerce_app/features/cart/data/repositories/cart_repository_impl/cart_repository_impl.dart'
    as _i723;
import 'package:e_commerce_app/features/cart/domain/repositories/cart_repository/cart_repository.dart'
    as _i1072;
import 'package:e_commerce_app/features/cart/domain/use_cases/add_cart_product_use_case.dart'
    as _i274;
import 'package:e_commerce_app/features/cart/domain/use_cases/clean_cart_use_case.dart'
    as _i595;
import 'package:e_commerce_app/features/cart/domain/use_cases/get_cart_products_use_case.dart'
    as _i202;
import 'package:e_commerce_app/features/cart/domain/use_cases/remove_cart_product_use_case.dart'
    as _i810;
import 'package:e_commerce_app/features/cart/domain/use_cases/update_cart_product_quantity_use_case.dart'
    as _i112;
import 'package:e_commerce_app/features/cart/presentation/bloc/cart_bloc/cart_bloc.dart'
    as _i724;
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
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/adapters.dart' as _i744;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i744.Box<_i52.CartProductModel>>(
      () => registerModule.cartBox(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dioClient());
    gh.lazySingleton<_i56.AppRouter>(() => _i56.AppRouter());
    gh.singleton<_i140.CartDataSource>(() =>
        _i1045.CartDataSourceImpl(gh<_i979.Box<_i52.CartProductModel>>()));
    gh.singleton<_i1072.CartRepository>(
        () => _i723.CartRepositoryImpl(gh<_i140.CartDataSource>()));
    gh.singleton<_i657.ProductDataSource>(
        () => _i750.ProductDataSourceImpl(gh<_i361.Dio>()));
    gh.factory<_i112.UpdateCartProductQuantityUseCase>(() =>
        _i112.UpdateCartProductQuantityUseCase(gh<_i1072.CartRepository>()));
    gh.factory<_i202.GetCartProductsUseCase>(
        () => _i202.GetCartProductsUseCase(gh<_i1072.CartRepository>()));
    gh.factory<_i810.RemoveCartProductUseCase>(
        () => _i810.RemoveCartProductUseCase(gh<_i1072.CartRepository>()));
    gh.factory<_i595.CleanCartUseCase>(
        () => _i595.CleanCartUseCase(gh<_i1072.CartRepository>()));
    gh.factory<_i274.AddCartProductUseCase>(
        () => _i274.AddCartProductUseCase(gh<_i1072.CartRepository>()));
    gh.singleton<_i577.ProductRepository>(
        () => _i843.ProductRepositoryImpl(gh<_i657.ProductDataSource>()));
    gh.factory<_i724.CartBloc>(() => _i724.CartBloc(
          gh<_i202.GetCartProductsUseCase>(),
          gh<_i112.UpdateCartProductQuantityUseCase>(),
          gh<_i810.RemoveCartProductUseCase>(),
          gh<_i595.CleanCartUseCase>(),
          gh<_i274.AddCartProductUseCase>(),
        ));
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

class _$RegisterModule extends _i521.RegisterModule {}
