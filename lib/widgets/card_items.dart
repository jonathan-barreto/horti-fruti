import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/app/models/cart_model.dart';
import 'package:store/constantes.dart';
import 'package:store/widgets/cart_image.dart';
import 'package:store/widgets/info_card.dart';
import 'package:store/widgets/quantidade.dart';

class CartItems extends StatefulWidget {
  final int index;
  final CartModel data;
  final CartPageController controller;

  const CartItems({
    super.key,
    required this.index,
    required this.data,
    required this.controller,
  });

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CartImage(image: '${Url.urlImage}${widget.data.image}'),
            InfoCard(
              nome: '${widget.data.nome}',
              preco: '${widget.data.preco}',
              peso: '${widget.data.peso}',
            ),
            Quantidade(
              data: widget.data,
              index: widget.index,
              controller: widget.controller,
            ),
          ],
        ),
      ),
    );
  }
}
