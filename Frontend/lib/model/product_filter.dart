import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/model/pagination.dart';

part 'product_filter.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  factory ProductFilterModel({
    required PaginationModel paginationModel,
    String? category_id,
  }) = _productFilterModel;
}
