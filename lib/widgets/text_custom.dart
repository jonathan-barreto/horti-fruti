import 'package:flutter/material.dart';
import 'package:store/constantes.dart';

class TextCustom extends StatelessWidget {
  final String text;

  const TextCustom({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor
      ),
    );
  }
}
