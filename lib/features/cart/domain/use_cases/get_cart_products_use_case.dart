import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_product_entity.dart';
import '../repositories/cart_repository/cart_repository.dart';

@injectable
class GetCartProductsUseCase {
  GetCartProductsUseCase(this._repository);

  final CartRepository _repository;

  Future<Either<Exception, List<CartProductEntity>>> execute() async {
    return _repository.getCartProducts();
  }
}
