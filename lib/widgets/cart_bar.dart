import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/constantes.dart';

class CartBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final CartPageController cartPageController;

  const CartBar({
    super.key,
    required this.title,
    required this.cartPageController,
  });

  @override
  State<CartBar> createState() => _CartBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CartBarState extends State<CartBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'CARRINHO',
        style: TextStyle(
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: (context),
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.delete_forever,
                          color: AppColors.primaryColor,
                          size: 200,
                        ),
                        const Text(
                          'Deseja remover todos items do carrinho?',
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                widget.cartPageController
                                    .removeAllItemsToCart();
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
              },
            );
          },
          icon: const Icon(
            Icons.delete_forever,
          ),
        ),
      ],
    );
  }
}
