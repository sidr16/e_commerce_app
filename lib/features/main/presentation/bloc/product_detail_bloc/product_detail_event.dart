import 'package:equatable/equatable.dart';

sealed class ProductDetailEvent extends Equatable {}

class ProductDetailFetchDataEvent extends ProductDetailEvent {
  ProductDetailFetchDataEvent(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
