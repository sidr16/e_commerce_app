import 'package:dartz/dartz.dart';

import '../../entities/category_entity/category_entity.dart';
import '../../entities/product_entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Exception, List<ProductEntity>>> fetchProductList({
    required String categoryName,
  });

  Future<Either<Exception, List<CategoryEntity>>> fetchProductCategoryList();

  Future<Either<Exception, ProductEntity>> fetchProductDetail(String id);
}
