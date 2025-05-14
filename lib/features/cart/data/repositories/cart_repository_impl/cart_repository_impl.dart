import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/cart_product_entity.dart';
import '../../../domain/repositories/cart_repository/cart_repository.dart';
import '../../data_sources/local/cart_data_source/cart_data_source.dart';
import '../../models/cart_product_model/cart_product_model.dart';

@Singleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl(this.localDataSource);

  final CartDataSource localDataSource;

  @override
  Future<Either<Exception, List<CartProductEntity>>> getCartProducts() async {
    try {
      final models = await localDataSource.getCartProducts();

      final entities = models.map((model) => model.toEntity()).toList();

      return Right(entities);
    } on Exception catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Exception, CartProductEntity>> updateCartProductQuantity({
    required String id,
    required int quantity,
  }) async {
    try {
      final updatedModel = await localDataSource.updateCartProductQuantity(
        id: id,
        quantity: quantity,
      );

      return Right(updatedModel.toEntity());
    } on Exception catch (error) {
      return Left(error);
    }
  }

  @override
  Future<void> addCartProduct(CartProductEntity product) async {
    return localDataSource.addCartProduct(
      CartProductModel.fromEntity(product),
    );
  }

  @override
  Future<void> removeCartProduct(String id) async {
    return localDataSource.removeCartProduct(id);
  }

  @override
  Future<void> cleanCart() async {
    return localDataSource.cleanCart();
  }
}
