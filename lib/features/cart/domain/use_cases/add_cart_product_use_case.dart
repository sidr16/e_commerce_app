import 'package:injectable/injectable.dart';

import '../entities/cart_product_entity.dart';
import '../repositories/cart_repository/cart_repository.dart';

@injectable
class AddCartProductUseCase {
  AddCartProductUseCase(this._repository);

  final CartRepository _repository;

  Future<void> execute(CartProductEntity product) async {
    return _repository.addCartProduct(product);
  }
}
