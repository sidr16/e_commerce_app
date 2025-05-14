import 'package:hive/hive.dart';

import '../../../domain/entities/cart_product_entity.dart';

part 'cart_product_model.g.dart';

@HiveType(typeId: 0)
class CartProductModel extends HiveObject {
  CartProductModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.price,
    this.quantity = 1,
  });

  // Conversion from Entity to Model
  factory CartProductModel.fromEntity(CartProductEntity entity) {
    return CartProductModel(
      idMeal: entity.idMeal,
      strMeal: entity.strMeal,
      strMealThumb: entity.strMealThumb,
      price: entity.price,
      quantity: entity.quantity,
    );
  }

  @HiveField(0)
  final String idMeal;

  @HiveField(1)
  final String strMeal;

  @HiveField(2)
  final String strMealThumb;

  @HiveField(3)
  final double price;

  @HiveField(4)
  int quantity;

  CartProductEntity toEntity() {
    return CartProductEntity(
      idMeal: idMeal,
      strMeal: strMeal,
      strMealThumb: strMealThumb,
      price: price,
      quantity: quantity,
    );
  }
}
