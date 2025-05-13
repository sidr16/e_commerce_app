import '../../../models/category_model/category_model.dart';
import '../../../models/product_model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> fetchProductList({
    required String categoryName,
  });

  Future<List<CategoryModel>> fetchProductCategoryList();

  Future<ProductModel> fetchProductDetail(String id);
}
