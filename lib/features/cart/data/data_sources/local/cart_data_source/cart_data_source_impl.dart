import 'package:collection/collection.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../models/cart_product_model/cart_product_model.dart';
import 'cart_data_source.dart';

@Singleton(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
  CartDataSourceImpl(this.cartBox);

  final Box<CartProductModel> cartBox;

  @override
  Future<List<CartProductModel>> getCartProducts() async {
    return cartBox.values.toList();
  }

  @override
  Future<CartProductModel> updateCartProductQuantity({
    required String id,
    required int quantity,
  }) async {
    final cartProduct = cartBox.values
        .firstWhere((element) => element.idMeal == id)
      ..quantity = quantity;

    await cartProduct.save();
    return cartProduct;
  }

  @override
  Future<void> removeCartProduct(String id) async {
    final cartProduct =
        cartBox.values.firstWhere((element) => element.idMeal == id);

    if (cartProduct.quantity > 1) {
      await updateCartProductQuantity(
        id: id,
        quantity: cartProduct.quantity - 1,
      );
      return;
    }

    await cartProduct.delete();
  }

  @override
  Future<void> cleanCart() async {
    await cartBox.clear();
  }

  @override
  Future<void> addCartProduct(CartProductModel product) async {
    final existingProduct = cartBox.values
        .firstWhereOrNull((item) => item.idMeal == product.idMeal);

    if (existingProduct != null) {
      await updateCartProductQuantity(
        id: product.idMeal,
        quantity: existingProduct.quantity + 1,
      );
      return;
    }

    await cartBox.add(product);
  }
}
