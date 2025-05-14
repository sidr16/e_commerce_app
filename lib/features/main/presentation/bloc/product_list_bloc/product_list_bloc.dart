import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/category_entity/category_entity.dart';
import '../../../domain/use_cases/fetch_product_list_use_case.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc(this._productListUseCase) : super(ProductListLoadingState()) {
    on<ProductListFetchDataEvent>(_onFetchData);
  }

  final FetchProductListUseCase _productListUseCase;

  void fetchData(CategoryEntity category) {
    add(ProductListFetchDataEvent(category));
  }

  Future<void> _onFetchData(
    ProductListFetchDataEvent event,
    Emitter<ProductListState> emit,
  ) async {
    if (state is ProductListDataState) return;

    final data = await _productListUseCase.fetch(
      FetchProductListParams(
        cast(event.category.name),
      ),
    );

    emit(
      data.fold<ProductListState>(
        ProductListErrorState.new,
        ProductListDataState.new,
      ),
    );
  }
}
