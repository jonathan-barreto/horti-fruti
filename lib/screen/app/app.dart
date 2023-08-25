import 'package:flutter/material.dart';
import 'package:store/screen/cart/cart.dart';
import 'package:store/screen/home/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/cart': (context) => const Cart(),
      },
    );
  }
}
