import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';
import 'package:store/app/models/home_page_model.dart';
import 'package:store/widgets/add_button.dart';
import 'package:store/widgets/card_image.dart';
import 'package:store/widgets/info_card.dart';
import 'package:store/constantes.dart';

class CardFruta extends StatelessWidget {
  final HomePageModel data;
  final HomePageController controller;

  const CardFruta({
    super.key,
    required this.data,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.backgroundColorCard,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: CardImage(
              image: '${Url.urlImage}${data.image}',
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(
                  nome: '${data.nome}',
                  preco: '${data.preco}',
                  peso: '${data.peso}',
                ),
                AddButton(
                  data: data,
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
