import 'package:equatable/equatable.dart';

import '../../../domain/entities/cart_product_entity.dart';

sealed class CartState extends Equatable {}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartDataState extends CartState {
  CartDataState(this.products);

  final List<CartProductEntity> products;

  @override
  List<Object?> get props => [products];
}

class CartErrorState extends CartState {
  CartErrorState(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
