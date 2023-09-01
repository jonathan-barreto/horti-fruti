import 'package:flutter/material.dart';
import 'package:store/constantes.dart';

class ListCard extends StatelessWidget {
  final Widget child;

  const ListCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        color: AppColors.primaryColor,
        axisDirection: AxisDirection.down,
        child: child,
      ),
    );
  }
}
