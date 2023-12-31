import 'package:flutter/material.dart';
import 'package:store/app/views/cart_page.dart';
import 'package:store/app/views/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) => const HomePage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}