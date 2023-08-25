import 'package:flutter/material.dart';
import 'package:store/controller/fruta_controller.dart';
import 'package:store/widgets/card_fruta.dart';
import 'package:store/widgets/carrinho.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FrutaController controller = FrutaController();

  @override
  void initState() {
    super.initState();
    controller.fetch();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: const Color(0xff020402),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff454ADE),
        title: const Text(
          'HORTI FRÚTI',
          style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Carrinho(
            controller: controller,
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
      ),
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Color(0xff454ADE),
              ),
            )
          : GridView.builder(
              itemCount: controller.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (itemWidth / itemHeight),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: ((BuildContext context, int index) {
                return CardFruta(
                  index: index,
                  controller: controller,
                  data: controller.data[index],
                );
              }),
            ),
    );
  }
}
