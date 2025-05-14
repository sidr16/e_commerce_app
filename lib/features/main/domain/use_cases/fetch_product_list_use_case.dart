import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity/product_entity.dart';
import '../repositories/product_repository/product_repository.dart';

class FetchProductListParams {
  const FetchProductListParams(this.categoryName);

  final String categoryName;
}

@injectable
class FetchProductListUseCase {
  FetchProductListUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<Exception, List<ProductEntity>>> fetch(
    FetchProductListParams params,
  ) async {
    return _repository.fetchProductList(
      categoryName: params.categoryName,
    );
  }
}
