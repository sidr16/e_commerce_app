import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/add_cart_product_use_case.dart';
import '../../../domain/use_cases/clean_cart_use_case.dart';
import '../../../domain/use_cases/get_cart_products_use_case.dart';
import '../../../domain/use_cases/remove_cart_product_use_case.dart';
import '../../../domain/use_cases/update_cart_product_quantity_use_case.dart';
import 'cart_event.dart';
import 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(
    this._getCartProducts,
    this._updateCartProductQuantity,
    this._removeCartProduct,
    this._cleanCart,
    this._addCartProduct,
  ) : super(CartLoadingState()) {
    on<GetCartProductsEvent>(_onGetCartEvent);
    on<UpdateCartProductQuantityEvent>(_onUpdateCartProductQuantityEvent);
    on<RemoveCartProductEvent>(_onRemoveCartProductEvent);
    on<CleanCartEvent>(_onCleanCartEvent);
    on<AddCartProductEvent>(_onAddCartProduct);
  }

  final GetCartProductsUseCase _getCartProducts;
  final UpdateCartProductQuantityUseCase _updateCartProductQuantity;
  final RemoveCartProductUseCase _removeCartProduct;
  final CleanCartUseCase _cleanCart;
  final AddCartProductUseCase _addCartProduct;

  void getCartProducts() {
    add(GetCartProductsEvent());
  }

  double? getAllProductFinalPrice() {
    final temp = state;

    if (temp is CartDataState) {
      return temp.products.map((item) => item.fullPrice).sum;
    }

    return null;
  }

  Future<void> _onGetCartEvent(
    GetCartProductsEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await _getCartProducts.execute();
    emit(
      result.fold(
        CartErrorState.new,
        CartDataState.new,
      ),
    );
  }

  Future<void> _onUpdateCartProductQuantityEvent(
    UpdateCartProductQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    await _updateCartProductQuantity.execute(
      id: event.id,
      quantity: event.quantity,
    );
    getCartProducts();
  }

  Future<void> _onAddCartProduct(
    AddCartProductEvent event,
    Emitter<CartState> emit,
  ) async {
    await _addCartProduct.execute(event.product);
    getCartProducts();
  }

  Future<void> _onRemoveCartProductEvent(
    RemoveCartProductEvent event,
    Emitter<CartState> emit,
  ) async {
    await _removeCartProduct.execute(event.id);
    getCartProducts();
  }

  Future<void> _onCleanCartEvent(
    CleanCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _cleanCart.execute();
    emit(CartDataState(const []));
  }
}
