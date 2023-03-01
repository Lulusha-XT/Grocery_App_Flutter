import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/application/notifier/cart_notifier.dart';
import 'package:grocery_app/application/notifier/order_payment_notifier.dart';
import 'package:grocery_app/application/state/cart_state.dart';
import 'package:grocery_app/application/state/order_payment.state.dart';
import 'package:grocery_app/application/state/product_state.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/model/product_filter.dart';

import '../api/api_service.dart';
import '../model/category.dart';
import '../model/pagination.dart';
import 'model/slider.model.dart';
import 'application/notifier/product_filter_notifier.dart';
import 'application/notifier/product_notifier.dart';

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

final productFilterProvider =
    StateNotifierProvider<ProductFilterNotifier, ProductFilterModel>(
        (ref) => ProductFilterNotifier());

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(
    ref.watch(apiService),
    ref.watch(productFilterProvider),
  ),
);

final SliderProvider =
    FutureProvider.family<List<SliderModel>?, PaginationModel>(
        (ref, paginationModel) {
  final sliderRepo = ref.watch(apiService);
  return sliderRepo.getSliders(paginationModel.page, paginationModel.pageSize);
});

final ProductDetailsProvider = FutureProvider.family<Product?, String>(
  (ref, product_id) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getProductDetails(product_id);
  },
);

final relatedProductsProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
  (ref, productFilterModel) {
    final apiRepository = ref.watch(apiService);
    return apiRepository.getProuduct(productFilterModel);
  },
);

final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(
    ref.watch(apiService),
  ),
);

final orderPaymentProvider =
    StateNotifierProvider<OrderPaymentNotifier, OrderPaymentState>(
  (ref) => OrderPaymentNotifier(
    ref.watch(apiService),
  ),
);
