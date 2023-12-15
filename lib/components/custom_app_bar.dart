import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/custom_icon_button.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/app_colors.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/style_constants.dart';

AppBar customAppBar({required String appBarTitle}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(
      appBarTitle,
      style: StyleConstants.HEADING1,
    ),
    toolbarHeight: DimensionResource.D_60,
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
