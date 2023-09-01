import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';

class Carrinho extends StatefulWidget {
  final HomePageController controller;

  const Carrinho({
    super.key,
    required this.controller,
  });

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await Navigator.of(context).pushNamed(
              '/cart',
              arguments: {
                "args": widget.controller,
              },
            );
            widget.controller.returnLenghtToCart();
          },
          icon: const Icon(
            Icons.shopping_cart_sharp,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 20,
            height: 20,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${widget.controller.itemsTotal}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
