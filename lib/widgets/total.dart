import 'package:flutter/material.dart';
import 'package:store/constantes.dart';

class Total extends StatelessWidget {
  final double value;

  const Total({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_cart,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'TOTAL: R\$ ${value.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
