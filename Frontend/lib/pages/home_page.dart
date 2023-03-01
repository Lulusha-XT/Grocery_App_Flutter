import 'package:flutter/material.dart';
import 'package:grocery_app/utils/shared_service.dart';

import 'package:grocery_app/widgets/widget_home_categories.dart';
import 'package:grocery_app/widgets/widget_home_product.dart';
import 'package:grocery_app/widgets/widget_home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              SharedService.logout(context);
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: const [
            HomeSliderWidget(),
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
