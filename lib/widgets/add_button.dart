import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';
import 'package:store/app/models/home_page_model.dart';
import 'package:store/constantes.dart';

class AddButton extends StatelessWidget {
  final HomePageModel data;
  final HomePageController controller;

  const AddButton({
    super.key,
    required this.data,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          controller.addToCart(data);
        },
        style: const ButtonStyle(
          textStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            AppColors.primaryColor,
          ),
          fixedSize: MaterialStatePropertyAll(
            Size(500, 20),
          ),
        ),
        child: const Text(
          'ADICIONAR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: .5,
          ),
        ),
      ),
    );
  }
}
