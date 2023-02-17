import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/product_state.dart';
import 'package:grocery_app/model/pagination.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_filter.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ApiService _apiService;
  final ProductFilterModel _filterModel;

  ProductNotifier(this._apiService, this._filterModel)
      : super(const ProductState());

  int _page = 1;

  Future<void> getProducts() async {
    if (state.isLoading || state.hasNext) {
      return;
    }

    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page: _page,
        pageSize: 10,
      ),
    );

    final Product = await _apiService.getProuduct(filterModel);
    final newProducts = [...state.Products, ...Product!];

    if (Product.length % 10 != 0 || Product.isEmpty) {
      state = state.copyWith(hasNext: false);
    }

    state = state.copyWith(Products: newProducts);
    _page++;

    state = state.copyWith(isLoading: false);
  }

  Future<void> refreshProduct() async {
    state = state.copyWith(Products: [], hasNext: false);
    _page = 1;

    await getProducts();
  }
}
