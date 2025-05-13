import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_entity/product_entity.dart';

sealed class ProductDetailState extends Equatable {}

class ProductDetailLoadingState extends ProductDetailState {
  @override
  List<Object?> get props => [];
}

class ProductDetailDataState extends ProductDetailState {
  ProductDetailDataState(this.product);

  final ProductEntity product;

  @override
  List<Object?> get props => [product];
}

class ProductDetailErrorState extends ProductDetailState {
  ProductDetailErrorState(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
