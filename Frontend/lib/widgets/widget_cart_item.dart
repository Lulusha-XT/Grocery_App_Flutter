import 'package:flutter/material.dart';
import 'package:grocery_app/components/widget_custom_stepper.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/cart_product.dart';
import 'package:grocery_app/model/product.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    Key? key,
    required this.model,
    this.onQtUpdate,
    this.onItemRemove,
  }) : super(key: key);

  final CartProduct model;
  final Function? onQtUpdate;
  final Function? onItemRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.white),
        child: cartItemUI(context),
      ),
    );
  }

  Widget cartItemUI(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5.0),
          child: Container(
            width: 100,
            alignment: Alignment.center,
            child: Image.network(
              model.product.product_image != ""
                  ? model.product.fullImagePath
                  : "",
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.product.product_name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${Config.currency}${model.product.product_price.toString()}",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 20,
                    stepValue: 1,
                    iconSize: 15.0,
                    value: model.qty.toInt(),
                    onChenged: (value) {
                      onQtUpdate!(model, value["qty"], value["type"]);
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        onItemRemove!(model);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
