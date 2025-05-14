import 'package:injectable/injectable.dart';

import '../repositories/cart_repository/cart_repository.dart';

@injectable
class RemoveCartProductUseCase {
  RemoveCartProductUseCase(this._repository);

  final CartRepository _repository;

  Future<void> execute(String id) async {
    return _repository.removeCartProduct(id);
  }
}
