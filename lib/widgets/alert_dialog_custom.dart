import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/constantes.dart';

class AlertDialogCustom extends StatelessWidget {
  final int index;
  final CartPageController controller;

  const AlertDialogCustom({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.delete,
              color: AppColors.primaryColor,
              size: 200,
            ),
            const Text(
              'Deseja remover esse item do carrinho?',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    controller.removeItem(index);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sim',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Não',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
