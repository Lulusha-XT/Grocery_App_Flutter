import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/product_card.dart';
import 'package:grocery_app/model/pagination.dart';
import 'package:grocery_app/model/product_filter.dart';
import 'package:grocery_app/model/product_sort.dart';
import 'package:grocery_app/providers.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? category_id;
  String? category_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("products"),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProductFilter(
              category_name: category_name,
              category_id: category_id,
            ),
            Flexible(
              flex: 1,
              child: _ProductList(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      category_name = arguments['category_name'];
      category_id = arguments['category_id'];
    }
    super.didChangeDependencies();
  }
}

class _ProductFilter extends ConsumerWidget {
  final _sortByOption = [
    ProductSortModel(value: "createdAt", label: "Latest"),
    ProductSortModel(value: "-product_price", label: "Price: High to Low"),
    ProductSortModel(value: "product_price", label: "Price: Low to High"),
  ];

  _ProductFilter({
    this.category_name,
    this.category_id,
  });

  final String? category_name;
  final String? category_id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productFilterProvider);
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category_name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: PopupMenuButton(
              onSelected: (sort_by) {
                ProductFilterModel filterModel = ProductFilterModel(
                    paginationModel: PaginationModel(page: 0, pageSize: 10),
                    category_id: filterProvider.category_id,
                    sort_by: sort_by.toString());
                ref
                    .read(productFilterProvider.notifier)
                    .setProductFilter(filterModel);
                ref.read(productNotifierProvider.notifier).getProducts();
              },
              initialValue: filterProvider.sort_by,
              itemBuilder: (BuildContext context) {
                return _sortByOption.map(
                  (item) {
                    return PopupMenuItem(
                      value: item.value,
                      child: InkWell(
                        child: Text(item.label!),
                      ),
                    );
                  },
                ).toList();
              },
              icon: const Icon(Icons.filter_list_alt),
            ),
          )
        ],
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          final producstViewModel = ref.read(productNotifierProvider.notifier);
          final productState = ref.watch(productNotifierProvider);

          if (productState.hasNext) {
            producstViewModel.getProducts();
          }
        }
      },
    );

    if (productState.products.isEmpty) {
      if (!productState.hasNext && !productState.isLoading) {
        return const Center(
          child: Text("Not produts"),
        );
      }
      return const LinearProgressIndicator();
    }

    return RefreshIndicator(
        onRefresh: () async {
          ref.read(productNotifierProvider.notifier).refreshProduct();
        },
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 2,
                controller: _scrollController,
                children: List.generate(
                  productState.products.length,
                  (index) {
                    return ProductCard(
                      model: productState.products[index],
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible:
                  productState.isLoading && productState.products.isNotEmpty,
              child: const SizedBox(
                height: 35,
                width: 35,
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ));
  }
}
