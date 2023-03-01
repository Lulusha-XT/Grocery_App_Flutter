import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/model/product.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
abstract class CartProduct with _$CartProduct {
  factory CartProduct({
    required double qty,
    required Product product,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}
