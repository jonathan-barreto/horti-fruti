import 'package:flutter/material.dart';
import 'package:store/app/controllers/home_page_controller.dart';
import 'package:store/constantes.dart';
import 'package:store/widgets/grid_view_home.dart';
import 'package:store/widgets/home_bar.dart';
import 'package:store/widgets/list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = HomePageController();

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
      backgroundColor: AppColors.backgroundColorApp,
      appBar: HomePageBar(
        controller: controller,
        title: 'HORTI FRÚTI',
      ),
      body: controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: AppColors.primaryColor,
              ),
            )
          : ListCard(
              child: GridViewHome(
                controller: controller,
                itemHeight: itemHeight,
                itemWidth: itemWidth,
              ),
            ),
    );
  }
}
