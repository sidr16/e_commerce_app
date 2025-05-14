import '../../../domain/entities/product_entity/product_entity.dart';

class ProductModel {
  ProductModel({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    this.strYoutube,
    this.strInstructions,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
      strYoutube: json['strYoutube'] as String?,
      strInstructions: json['strInstructions'] as String?,
    );
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      idMeal: entity.id,
      strMeal: entity.name,
      strMealThumb: entity.thumbUrl,
      strYoutube: entity.strYoutube,
      strInstructions: entity.strInstructions,
    );
  }

  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String? strYoutube;
  final String? strInstructions;

  Map<String, dynamic> toJson() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'strYoutube': strYoutube,
      'strInstructions': strInstructions,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: idMeal,
      name: strMeal,
      thumbUrl: strMealThumb,
      strYoutube: strYoutube,
      strInstructions: strInstructions,
    );
  }
}
