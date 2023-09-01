import 'package:flutter/material.dart';
import 'package:store/constantes.dart';

class RichTextCustom extends StatelessWidget {
  final String preco, peso;

  const RichTextCustom({
    super.key,
    required this.preco,
    required this.peso,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'R\$$preco ',
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: '/ $peso',
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
