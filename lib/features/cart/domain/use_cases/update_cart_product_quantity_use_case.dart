import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_product_entity.dart';
import '../repositories/cart_repository/cart_repository.dart';

@injectable
class UpdateCartProductQuantityUseCase {
  UpdateCartProductQuantityUseCase(this._repository);

  final CartRepository _repository;

  Future<Either<Exception, CartProductEntity>> execute({
    required String id,
    required int quantity,
  }) async {
    return _repository.updateCartProductQuantity(id: id, quantity: quantity);
  }
}
