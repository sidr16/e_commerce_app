import 'package:equatable/equatable.dart';

import '../../../domain/entities/category_entity/category_entity.dart';

sealed class ProductCategoryListState extends Equatable {}

class ProductCategoryListLoadingState extends ProductCategoryListState {
  @override
  List<Object?> get props => [];
}

class ProductCategoryListDataState extends ProductCategoryListState {
  ProductCategoryListDataState(this.categories);

  final List<CategoryEntity> categories;

  @override
  List<Object?> get props => [categories];
}

class ProductCategoryListErrorState extends ProductCategoryListState {
  ProductCategoryListErrorState(this.error);

  final Exception error;

  @override
  List<Object?> get props => [error];
}
