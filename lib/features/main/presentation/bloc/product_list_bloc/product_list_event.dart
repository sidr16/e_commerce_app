import 'package:equatable/equatable.dart';

import '../../../domain/entities/category_entity/category_entity.dart';

sealed class ProductListEvent extends Equatable {}

class ProductListFetchDataEvent extends ProductListEvent {
  ProductListFetchDataEvent(this.category);

  final CategoryEntity category;

  @override
  List<Object?> get props => [category];
}
