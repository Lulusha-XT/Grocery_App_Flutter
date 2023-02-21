import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/model/pagination.dart';
import 'package:grocery_app/model/product_filter.dart';
import 'package:grocery_app/model/category.dart';
import 'package:grocery_app/providers.dart';

class HomeCategoriesWidget extends ConsumerWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "All Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _categoriesList(ref),
          )
        ],
      ),
    );
  }

  Widget _categoriesList(WidgetRef ref) {
    final categories = ref.watch(
      categoriesProvider(
        PaginationModel(page: 1, pageSize: 10),
      ),
    );

    return categories.when(
      data: (list) {
        return _buildCategoryList(list!, ref);
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCategoryList(List<Category> categories, WidgetRef ref) {
    return Container(
      height: 100,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              ProductFilterModel filterModel = ProductFilterModel(
                paginationModel: PaginationModel(page: 1, pageSize: 10),
                category_id: data.category_id,
              );

              ref
                  .read(productFilterProvider.notifier)
                  .setProductFilter(filterModel);

              ref.read(productNotifierProvider.notifier).getProducts();

              Navigator.of(context).pushNamed(
                "/products",
                arguments: {
                  "category_id": data.category_id,
                  "category_name": data.category_name
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Image.network(data.fullImagePath, height: 50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.category_name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 13,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
