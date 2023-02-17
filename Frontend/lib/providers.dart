import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_filter.dart';

import '../api/api_service.dart';
import '../model/category.dart';
import '../model/pagination.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
  (ref, paginationModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getCategories(
      paginationModel.page,
      paginationModel.pageSize,
    );
  },
);

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) {
  final apiRepository = ref.watch(apiService);

  return apiRepository.getProuduct(productFilterModel);
});
