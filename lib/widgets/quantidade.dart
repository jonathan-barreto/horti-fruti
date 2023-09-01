import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/app/models/cart_model.dart';
import 'package:store/widgets/alert_dialog_custom.dart';
import 'package:store/widgets/text_custom.dart';

class Quantidade extends StatefulWidget {
  final int index;
  final CartModel data;
  final CartPageController controller;

  const Quantidade({
    super.key,
    required this.index,
    required this.data,
    required this.controller,
  });

  @override
  State<Quantidade> createState() => _QuantidadeState();
}

class _QuantidadeState extends State<Quantidade> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.data.quantidade == 1) {
                showDialog(
                  context: (context),
                  builder: (context) {
                    return AlertDialogCustom(
                      index: widget.index,
                      controller: widget.controller,
                    );
                  },
                );
              } else {
                widget.controller.decrementQuantidade(widget.index);
              }
            },
            child: const TextCustom(text: '-'),
          ),
          TextCustom(text: '${widget.data.quantidade}'),
          GestureDetector(
            onTap: () {
              widget.controller.incrementQuantidade(widget.index);
            },
            child: const TextCustom(text: '+'),
          ),
        ],
      ),
    );
  }
}
