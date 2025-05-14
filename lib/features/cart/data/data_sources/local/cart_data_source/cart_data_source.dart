import '../../../models/cart_product_model/cart_product_model.dart';

abstract class CartDataSource {
  Future<List<CartProductModel>> getCartProducts();

  Future<CartProductModel> updateCartProductQuantity({
    required String id,
    required int quantity,
  });

  Future<void> addCartProduct(CartProductModel product);

  Future<void> removeCartProduct(String id);

  Future<void> cleanCart();
}
