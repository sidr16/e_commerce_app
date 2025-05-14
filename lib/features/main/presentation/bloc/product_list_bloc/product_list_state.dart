import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_entity/product_entity.dart';

sealed class ProductListState extends Equatable {}

class ProductListLoadingState extends ProductListState {
  @override
  List<Object?> get props => [];
}

class ProductListDataState extends ProductListState {
  ProductListDataState(this.products);

  final List<ProductEntity> products;

  @override
  List<Object?> get props => [products];
}

class ProductListErrorState extends ProductListState {
  ProductListErrorState(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
