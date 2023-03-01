import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/widget_col_exp.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/providers.dart';

import '../components/widget_custom_stepper.dart';
import '../config.dart';
import '../widgets/widget_related_product.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  String product_id = "";
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: SingleChildScrollView(
        child: _productDatails(ref),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      product_id = arguments["product_id"];
    }

    super.didChangeDependencies();
  }

  Widget _productDatails(WidgetRef ref) {
    final details = ref.watch(
      ProductDetailsProvider(product_id),
    );

    return details.when(
      data: (model) {
        print(model!.relatedProduct);
        // print(model!.product_name);
        // print(model!.product_id);
        // print(model!.category.category_id);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productDetailsUI(model),
            RelatedProductWidget(model.relatedProduct!),
            SizedBox(
              height: 10,
            )
          ],
        );
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _productDetailsUI(Product model) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              model.fullImagePath,
              fit: BoxFit.fitHeight,
            ),
            height: 200,
          ),
          Text(
            model.product_name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${Config.currency}${model.product_price.toString()}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: model.calculateDiscount > 0
                          ? Colors.red
                          : Colors.black,
                      decoration: model.product_sale_price > 0
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Text(
                    (model.calculateDiscount > 0)
                        ? " ${Config.currency}${model.product_sale_price.toString()}"
                        : "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Text(
                  "SHARE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                label: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          Text(
            "Avaliablity: ${model.product_SKU}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Product Code: ${model.product_SKU}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomStepper(
                lowerLimit: 1,
                upperLimit: 20,
                stepValue: 1,
                iconSize: 22.0,
                value: qty,
                onChenged: (value) {
                  qty = value["qty"];
                },
              ),
              TextButton.icon(
                onPressed: () {
                  final cartViewModel = ref.read(cartItemsProvider.notifier);
                  cartViewModel.addCartItem(model.product_id, qty);
                  print("this is product id ${model.product_id}  qty ${qty}");
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                icon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                label: const Text(
                  "Add to Catr",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ColExpand(
            title: "SHORT DESCRIPTION",
            content: model.product_short_description,
          )
        ],
      ),
    );
  }
}
