import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/constants/endpoints.dart';
import '../../../models/category_model/category_model.dart';
import '../../../models/product_model/product_model.dart';
import 'product_data_source.dart';

@Singleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  const ProductDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<List<CategoryModel>> fetchProductCategoryList() async {
    try {
      final res = await _client.get<Map<String, dynamic>>(Endpoints.categories);

      return (res.data!['categories'] as List<dynamic>).map((item) {
        return CategoryModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> fetchProductList({
    required String categoryName,
  }) async {
    try {
      final res = await _client.get<Map<String, dynamic>>(
        Endpoints.filter,
        queryParameters: {'c': categoryName},
      );

      return (res.data!['meals'] as List<dynamic>).map((item) {
        return ProductModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> fetchProductDetail(String id) async {
    try {
      final res = await _client.get<Map<String, dynamic>>(
        Endpoints.lookup,
        queryParameters: {'i': id},
      );

      return ProductModel.fromJson(
        (res.data!['meals'] as List<dynamic>)[0] as Map<String, dynamic>,
      );
    } catch (err) {
      rethrow;
    }
  }
}
