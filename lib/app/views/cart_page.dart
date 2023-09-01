import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/constantes.dart';
import 'package:store/widgets/carrinho_vazio.dart';
import 'package:store/widgets/cart_bar.dart';
import 'package:store/widgets/row_list.dart';
import 'package:store/widgets/total.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartPageController controller = CartPageController();

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
    return Scaffold(
      backgroundColor: AppColors.backgroundColorApp,
      appBar: CartBar(
        title: 'Carrinho',
        cartPageController: controller,
      ),
      body: controller.data.isEmpty
          ? const CarrinhoVazio()
          : Column(
              children: [
                Total(value: controller.total ?? 00.00),
                RowList(controller: controller),
              ],
            ),
    );
  }
}
