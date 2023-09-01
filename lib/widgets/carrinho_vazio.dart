import 'package:flutter/material.dart';
import 'package:store/constantes.dart';

class CarrinhoVazio extends StatelessWidget {
  const CarrinhoVazio({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            'CARRINHO VAZIO!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
        ),
        Image.asset(
          'assets/fruta.gif',
        ),
      ],
    );
  }
}
