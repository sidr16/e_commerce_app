import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/fetch_product_category_list_use_case.dart';
import 'product_category_list_event.dart';
import 'product_category_list_state.dart';

@injectable
class ProductCategoryListBloc
    extends Bloc<ProductCategoryListEvent, ProductCategoryListState> {
  ProductCategoryListBloc(this._productCategoryListUseCase)
      : super(ProductCategoryListLoadingState()) {
    on<ProductCategoryListFetchDataEvent>(_onFetchData);
  }

  final FetchProductCategoryListUseCase _productCategoryListUseCase;

  void fetchData() {
    add(ProductCategoryListFetchDataEvent());
  }

  Future<void> _onFetchData(
    ProductCategoryListEvent event,
    Emitter<ProductCategoryListState> emit,
  ) async {
    if (state is ProductCategoryListDataState) return;

    final data = await _productCategoryListUseCase.fetch();

    emit(
      data.fold<ProductCategoryListState>(
        ProductCategoryListErrorState.new,
        ProductCategoryListDataState.new,
      ),
    );
  }
}
