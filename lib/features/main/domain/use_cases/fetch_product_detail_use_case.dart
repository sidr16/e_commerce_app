import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity/product_entity.dart';
import '../repositories/product_repository/product_repository.dart';

class FetchProductDetailParams {
  const FetchProductDetailParams(this.id);

  final String id;
}

@injectable
class FetchProductDetailUseCase {
  FetchProductDetailUseCase(this._repository);

  final ProductRepository _repository;

  Future<Either<Exception, ProductEntity>> fetch(
    FetchProductDetailParams params,
  ) async {
    return _repository.fetchProductDetail(
      params.id,
    );
  }
}
