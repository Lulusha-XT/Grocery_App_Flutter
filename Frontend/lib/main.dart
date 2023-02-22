import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/pages/dashboard_page.dart';
import 'package:grocery_app/pages/home_page.dart';
import 'package:grocery_app/pages/login_page.dart';
import 'package:grocery_app/pages/product_details_page.dart';
import 'package:grocery_app/pages/products_page.dart';
import 'package:grocery_app/pages/register_page.dart';
import 'package:grocery_app/utils/shared_service.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool result = await SharedService.isLoggedIn();

  if (result) {
    _defaultHome = const DashboardPage();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: <String, WidgetBuilder>{
        '/': (context) => _defaultHome,
        '/register': (BuildContext context) => const RegisterPage(),
        '/home': (BuildContext context) => const DashboardPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/product-details': (BuildContext context) =>
            const ProductDetailsPage(),
      },
    );
  }
}
