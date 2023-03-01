// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartProduct _$$_CartProductFromJson(Map<String, dynamic> json) =>
    _$_CartProduct(
      qty: (json['qty'] as num).toDouble(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CartProductToJson(_$_CartProduct instance) =>
    <String, dynamic>{
      'qty': instance.qty,
      'product': instance.product,
    };
