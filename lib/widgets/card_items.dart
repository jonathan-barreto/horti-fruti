import 'package:flutter/material.dart';
import 'package:store/controller/cart_controller.dart';
import 'package:store/model/cart_model.dart';

class CartItems extends StatefulWidget {
  final int index;
  final CartModel data;
  final CartController controller;

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
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  'http://192.168.0.106/hortifruti/images/${widget.data.image}',
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.data.nome?.toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'R\$ ${widget.data.preco}',
                      style: const TextStyle(
                        color: Color(0xff454ADE),
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: ' / ${widget.data.peso}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (widget.data.quantidade == 1) {
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
                                    Image.asset('assets/delete.png'),
                                    const Text(
                                      'Deseja remover este item do carrinho?',
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            widget.controller.removeItem(widget.index);
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Sim'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Não'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        widget.controller.decrementQuantidade(widget.index);
                      }
                    },
                    child: const Text(
                      '-',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.data.quantidade}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.controller.incrementQuantidade(widget.index);
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
