import 'package:equatable/equatable.dart';

sealed class ProductCategoryListEvent extends Equatable {}

class ProductCategoryListFetchDataEvent extends ProductCategoryListEvent {
  @override
  List<Object?> get props => [];
}
