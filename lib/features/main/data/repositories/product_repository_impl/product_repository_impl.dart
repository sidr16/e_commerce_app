import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/category_entity/category_entity.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/repositories/product_repository/product_repository.dart';
import '../../data_sources/remote/product_data_source/product_data_source.dart';

@Singleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl(this._dataSource);

  final ProductDataSource _dataSource;

  @override
  Future<Either<Exception, List<CategoryEntity>>>
      fetchProductCategoryList() async {
    try {
      final res = await _dataSource.fetchProductCategoryList();

      return Right(res.map((item) => item.toEntity()).toList());
    } on Exception catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Exception, List<ProductEntity>>> fetchProductList({
    required String categoryName,
  }) async {
    try {
      final res = await _dataSource.fetchProductList(
        categoryName: categoryName,
      );

      return Right(res.map((item) => item.toEntity()).toList());
    } on Exception catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Exception, ProductEntity>> fetchProductDetail(String id) async {
    try {
      final res = await _dataSource.fetchProductDetail(id);

      return Right(res.toEntity());
    } on Exception catch (err) {
      return Left(err);
    }
  }
}
