import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String image;

  const CardImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Image.network(image),
    );
  }
}
