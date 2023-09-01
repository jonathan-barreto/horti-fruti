import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';
import 'package:store/constantes.dart';
import 'package:store/widgets/carrinho.dart';

class HomePageBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final HomePageController controller;

  const HomePageBar({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  State<HomePageBar> createState() => _HomePageBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomePageBarState extends State<HomePageBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      title: Text(
        widget.title,
        style: const TextStyle(
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Carrinho(
          controller: widget.controller,
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
        ),
      ),
    );
  }
}
