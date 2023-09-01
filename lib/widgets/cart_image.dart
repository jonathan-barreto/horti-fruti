import 'package:flutter/material.dart';

class CartImage extends StatelessWidget {
  final String image;

  const CartImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
