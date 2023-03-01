import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/model/cart.dart';
import 'package:grocery_app/model/cart_product.dart';
import 'package:grocery_app/providers.dart';
import 'package:grocery_app/widgets/widget_cart_item.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      bottomNavigationBar: _checkoutBottomNavbar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: _cartList(ref),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(List<CartProduct> cartProduct, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: cartProduct.length,
      itemBuilder: (context, index) {
        return CartItemWidget(
          model: cartProduct[index],
          onQtUpdate: (CartProduct model, qty, type) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.updateQty(model.product.product_id, qty, type);
          },
          onItemRemove: (CartProduct model) {
            final cartViewModel = ref.read(cartItemsProvider.notifier);
            cartViewModel.removeCartItem(model.product.product_id, model.qty);
          },
        );
      },
    );
  }

  Widget _cartList(WidgetRef ref) {
    final cartState = ref.watch(cartItemsProvider);
    if (cartState.cartModel == null) {
      return const LinearProgressIndicator();
    }

    if (cartState.cartModel!.products.isEmpty) {
      return const Center(
        child: Text(
          'Cart Empty',
        ),
      );
    }
    return _buildCartItem(cartState.cartModel!.products, ref);
  }
}

class _checkoutBottomNavbar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);

    if (cartProvider.cartModel != null) {
      return cartProvider.cartModel!.products.isNotEmpty
          ? Container(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ${Config.currency}${cartProvider.cartModel!.grandTotal.toString()}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: const Text(
                          "Proceed to check out",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed("/payments");
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox();
    }
    return const SizedBox();
  }
}
