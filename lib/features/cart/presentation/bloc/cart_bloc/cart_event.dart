import '../../../domain/entities/cart_product_entity.dart';

class CartEvent {}

class GetCartProductsEvent extends CartEvent {}

class UpdateCartProductQuantityEvent extends CartEvent {
  UpdateCartProductQuantityEvent(this.id, this.quantity);

  final String id;
  final int quantity;
}

class AddCartProductEvent extends CartEvent {
  AddCartProductEvent(this.product);

  final CartProductEntity product;
}

class RemoveCartProductEvent extends CartEvent {
  RemoveCartProductEvent(this.id);

  final String id;
}

class CleanCartEvent extends CartEvent {}
