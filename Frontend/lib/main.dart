import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/pages/home_page.dart';
import 'package:grocery_app/pages/login_page.dart';
import 'package:grocery_app/pages/products_page.dart';
import 'package:grocery_app/pages/register_page.dart';

void main() {
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
      home: const RegisterPage(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => const RegisterPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/products': (BuildContext context) => const ProductsPage(),
      },
    );
  }
}
