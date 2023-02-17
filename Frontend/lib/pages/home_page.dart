import 'package:flutter/material.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/widgets/widget_home_categories.dart';
import 'package:grocery_app/widgets/widget_home_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: const [
            HomeCategoriesWidget(),
            HomeProductsWidget(),
            // ProductCard(model: model),
          ],
        ),
      ),
    );
  }
}

class HomeProdutsWidget {}
