import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:grocery_app/pages/dashboard_page.dart';
import 'package:grocery_app/pages/login_page.dart';
import 'package:grocery_app/pages/order_success.dart';
import 'package:grocery_app/pages/payment_page.dart';
import 'package:grocery_app/pages/product_details_page.dart';
import 'package:grocery_app/pages/products_page.dart';
import 'package:grocery_app/pages/register_page.dart';
import 'package:grocery_app/utils/shared_service.dart';

Widget _defaultHome = const LoginPage();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();

  if (result) {
    _defaultHome = const DashboardPage();
  }

  Stripe.publishableKey =
      "pk_test_51Mg3GRAZOwFvn38RGaMNtNGpAGtWGCLZo4hazkuMWzqYpvrVLtYVlc8AdaqeMKiEMWSP1DjGYvUUcvaw381VW65X00cVRpEL0O";
  await Stripe.instance.applySettings();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const RegisterPage(),
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder>{
        '/': (context) => _defaultHome,
        '/register': (BuildContext context) => const RegisterPage(),
        '/home': (BuildContext context) => const DashboardPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/product-details': (BuildContext context) =>
            const ProductDetailsPage(),
        '/payments': (context) => const PaymentPage(),
        '/order-success': (context) => const OrderSuccess(),
      },
    );
  }
}
