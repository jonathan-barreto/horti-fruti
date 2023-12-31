import 'package:flutter/material.dart';
import 'package:store/constantes.dart';
import 'package:store/widgets/rich_text_custom.dart';

class InfoCard extends StatelessWidget {
  final int? flex;
  final String nome, preco, peso;

  const InfoCard({
    super.key,
    this.flex = 1,
    required this.nome,
    required this.preco,
    required this.peso,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nome.toUpperCase(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          RichTextCustom(
            preco: preco,
            peso: peso,
          ),
        ],
      ),
    );
  }
}
