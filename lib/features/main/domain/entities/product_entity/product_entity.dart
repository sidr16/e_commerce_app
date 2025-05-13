class ProductEntity {
  ProductEntity({
    required this.id,
    required this.name,
    required this.thumbUrl,
    this.strYoutube,
    this.strInstructions,
  });

  final String id;
  final String name;
  final String thumbUrl;
  final String? strYoutube;
  final String? strInstructions;
}
