import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';

Widget customIconButton({
  required IconData icon,
  required VoidCallback onPressed,
  Color? color,
  double? size,
}) {
  return IconButton(
    icon: Icon(
      icon,
      color: color ??= Colors.white,
      size: size ??= DimensionResource.D_25,
    ),
    onPressed: onPressed,
  );
}
