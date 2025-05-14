import 'package:injectable/injectable.dart';

import '../repositories/cart_repository/cart_repository.dart';

@injectable
class CleanCartUseCase {
  CleanCartUseCase(this._repository);

  final CartRepository _repository;

  Future<void> execute() async {
    return _repository.cleanCart();
  }
}
