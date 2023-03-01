import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productFromJson(dynamic str) =>
    List<Product>.from((str).map((e) => Product.fromJson(e)));

@freezed
abstract class Product with _$Product {
  factory Product({
    required String product_name,
    required Category category,
    required String? product_short_description,
    required String? product_description,
    required double product_price,
    required double product_sale_price,
    required String product_image,
    required String? product_SKU,
    required String? product_type,
    required String? stack_status,
    required String product_id,
    List<String>? relatedProduct,
  }) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductExt on Product {
  String get fullImagePath => Config.imageURL + product_image;

  int get calculateDiscount {
    double disPercent = 0;

    if (!product_price.isNaN) {
      double regular_price = product_price;
      double sale_price =
          product_sale_price > 0 ? product_sale_price : regular_price;
      double discount = regular_price - sale_price;
      disPercent = (discount / regular_price) * 100;
    }
    return disPercent.round();
  }
}
