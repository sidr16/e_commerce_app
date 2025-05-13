import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/category_entity/category_entity.dart';
import '../repositories/product_repository/product_repository.dart';

@injectable
class FetchProductCategoryListUseCase {
  FetchProductCategoryListUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<Exception, List<CategoryEntity>>> fetch() async {
    return _repository.fetchProductCategoryList();
  }
}
