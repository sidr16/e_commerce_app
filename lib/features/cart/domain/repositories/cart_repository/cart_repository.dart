import 'package:dartz/dartz.dart';

import '../../entities/cart_product_entity.dart';

abstract class CartRepository {
  Future<Either<Exception, List<CartProductEntity>>> getCartProducts();

  Future<Either<Exception, CartProductEntity>> updateCartProductQuantity({
    required String id,
    required int quantity,
  });

  Future<void> addCartProduct(CartProductEntity product);

  Future<void> removeCartProduct(String id);

  Future<void> cleanCart();
}
