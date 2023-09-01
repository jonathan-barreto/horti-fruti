import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';
import 'package:store/widgets/card_fruta.dart';

class GridViewHome extends StatelessWidget {
  final HomePageController controller;
  final double itemWidth, itemHeight;

  const GridViewHome({
    super.key,
    required this.controller,
    required this.itemWidth,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (itemWidth / itemHeight),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemBuilder: ((BuildContext context, int index) {
        return CardFruta(
          data: controller.data[index],
          controller: controller,
        );
      }),
    );
  }
}
