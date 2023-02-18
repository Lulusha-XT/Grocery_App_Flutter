import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/product_state.dart';
import 'package:grocery_app/model/pagination.dart';
import 'package:grocery_app/model/product_filter.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ApiService _apiService;
  final ProductFilterModel _filterModel;

  ProductNotifier(this._apiService, this._filterModel)
      : super(const ProductState());

  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }

    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page: _page,
        pageSize: 10,
      ),
    );

    final product = await _apiService.getProuduct(filterModel);
    final newProducts = [...state.products, ...product!];

    if (product.length % 10 != 0 || product.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    Future.delayed(const Duration(milliseconds: 1500), () {
      state = state.copyWith(products: newProducts);
      _page++;

      state = state.copyWith(isLoading: false);
    });
  }

  Future<void> refreshProduct() async {
    state = state.copyWith(products: [], hasNext: true);
    _page = 1;

    await getProducts();
  }
}
