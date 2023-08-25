import 'package:flutter/material.dart';
import 'package:store/controller/fruta_controller.dart';
import 'package:store/model/fruta_model.dart';

class CardFruta extends StatelessWidget {
  final FrutaController controller;
  final FrutaModel data;
  final int index;

  const CardFruta({
    super.key,
    required this.controller,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.network(
                'http://192.168.0.106/hortifruti/images/${data.image}',
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${data.nome?.toUpperCase()}',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'R\$${data.preco} ',
                          style: const TextStyle(
                            color: Color(0xff454ADE),
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '/ ${data.peso}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
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
                      Color(0xff454ADE),
                    ),
                    fixedSize: MaterialStatePropertyAll(
                      Size(500, 50),
                    ),
                  ),
                  child: const Text('Add to cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
