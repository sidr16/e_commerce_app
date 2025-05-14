class CartProductEntity {
  CartProductEntity({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.price,
    this.quantity = 1,
  });

  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final double price;
  final int quantity;

  double get fullPrice => price * quantity;
}
