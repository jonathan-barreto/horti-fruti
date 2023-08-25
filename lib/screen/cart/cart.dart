import 'package:flutter/material.dart';
import 'package:store/controller/cart_controller.dart';
import 'package:store/controller/fruta_controller.dart';
import 'package:store/widgets/card_items.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController controller = CartController();

  @override
  void initState() {
    super.initState();
    controller.fetch();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    FrutaController data = args['args'] as FrutaController;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Carrinho'),
        backgroundColor: const Color(0xff454ADE),
        actions: [
          IconButton(
            onPressed: () {
              data.removeToCart();
              controller.upgradeData();
            },
            icon: const Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
      body: controller.data.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'CARRINHO VAZIO!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/carrinho_vazio.png',
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.store,
                            color: Color(0xff454ADE),
                          ),
                          Text(
                            'TOTAL: R\$ ${controller.total?.toStringAsFixed(2) ?? 00.00}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItems(
                        index: index,
                        data: controller.data[index],
                        controller: controller,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
