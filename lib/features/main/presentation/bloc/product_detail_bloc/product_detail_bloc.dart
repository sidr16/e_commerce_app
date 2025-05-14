import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/fetch_product_detail_use_case.dart';
import 'product_detail_event.dart';
import 'product_detail_state.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(this._productDetailUseCase)
      : super(ProductDetailLoadingState()) {
    on<ProductDetailFetchDataEvent>(_onFetchData);
  }

  final FetchProductDetailUseCase _productDetailUseCase;

  void fetchData(String id) {
    add(ProductDetailFetchDataEvent(id));
  }

  Future<void> _onFetchData(
    ProductDetailFetchDataEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    if (state is ProductDetailDataState) return;

    final data = await _productDetailUseCase.fetch(
      FetchProductDetailParams(
        cast(event.id),
      ),
    );

    emit(
      data.fold<ProductDetailState>(
        ProductDetailErrorState.new,
        ProductDetailDataState.new,
      ),
    );
  }
}
