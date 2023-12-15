import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/app_colors.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';

AppBar buildAppBar({required String appBarTitle}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    title: Text(
      appBarTitle,
      style: const TextStyle(
        fontSize: DimensionResource.FONT_25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    toolbarHeight: DimensionResource.D_60,
    actionsIconTheme: const IconThemeData(color: Colors.white),
    actions: [
      customIconButton(
        icon: Icons.shopping_cart_rounded,
        onPressed: () {},
      ),
      customIconButton(
        icon: Icons.menu_rounded,
        onPressed: () {},
      ),
    ],
  );
}

Widget customIconButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return IconButton(
    icon: Icon(
      icon,
      size: DimensionResource.D_25,
    ),
    onPressed: onPressed,
  );
}
