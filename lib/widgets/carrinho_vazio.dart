import 'package:flutter/material.dart';

class CarrinhoVazio extends StatelessWidget {
  const CarrinhoVazio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'CARRINHO VAZIO!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.asset(
          'assets/carrinho_vazio.png',
        ),
      ],
    );
  }
}
