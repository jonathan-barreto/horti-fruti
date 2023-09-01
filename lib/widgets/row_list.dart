import 'package:flutter/material.dart';
import 'package:store/app/controllers/cart_page_controller.dart';
import 'package:store/widgets/card_items.dart';
import 'package:store/widgets/list_card.dart';

class RowList extends StatelessWidget {
  final CartPageController controller;

  const RowList({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListCard(
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
    );
  }
}
