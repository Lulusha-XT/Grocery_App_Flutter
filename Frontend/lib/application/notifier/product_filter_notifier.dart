import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/model/pagination.dart';
import 'package:grocery_app/model/product_filter.dart';

class ProductFilterNotifier extends StateNotifier<ProductFilterModel> {
  ProductFilterNotifier()
      : super(
          ProductFilterModel(
            paginationModel: PaginationModel(page: 0, pageSize: 10),
          ),
        );

  void setProductFilter(ProductFilterModel model) {
    state = model;
  }
}
