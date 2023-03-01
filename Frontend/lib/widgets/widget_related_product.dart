import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/model/product_filter.dart';
import 'package:grocery_app/providers.dart';

import '../model/pagination.dart';
import '../model/product.dart';

class RelatedProductWidget extends ConsumerWidget {
  const RelatedProductWidget(this.relatedProduct, {Key? key}) : super(key: key);
  final List<String> relatedProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Text(
            "Related Product",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Visibility(
            visible: relatedProduct.isNotEmpty,
            child: _productList(ref),
          )
        ],
      ),
    );
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(
      relatedProductsProvider(
        ProductFilterModel(
          paginationModel: PaginationModel(page: 1, pageSize: 10),
          product_ids: relatedProduct,
        ),
      ),
    );

    return products.when(
      data: (List) {
        return _buildProductList(List!);
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildProductList(List<Product> product) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: ((context, index) {
          var data = product[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(
              model: data,
            ),
          );
        }),
      ),
    );
  }
}
