import 'package:flutter/widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String product_id = "";

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      product_id = arguments["product_id"];
    }

    super.didChangeDependencies();
  }
}
