// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      product_name: json['product_name'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      product_short_description: json['product_short_description'] as String,
      product_description: json['product_description'] as String,
      product_price: (json['product_price'] as num).toDouble(),
      product_sale_price: (json['product_sale_price'] as num).toDouble(),
      product_image: json['product_image'] as String,
      product_SKU: json['product_SKU'] as String,
      product_type: json['product_type'] as String,
      stack_status: json['stack_status'] as String,
      product_id: json['product_id'] as String,
      product_ids: (json['product_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'product_name': instance.product_name,
      'category': instance.category,
      'product_short_description': instance.product_short_description,
      'product_description': instance.product_description,
      'product_price': instance.product_price,
      'product_sale_price': instance.product_sale_price,
      'product_image': instance.product_image,
      'product_SKU': instance.product_SKU,
      'product_type': instance.product_type,
      'stack_status': instance.stack_status,
      'product_id': instance.product_id,
      'product_ids': instance.product_ids,
    };
