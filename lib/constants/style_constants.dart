import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';

class StyleConstants {
  static const TextStyle HEADING1 = TextStyle(
    fontSize: DimensionResource.FONT_23,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle HEADING2 = TextStyle(
      color: Colors.black,
      fontSize: DimensionResource.FONT_18,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis);

  static const TextStyle SUB_HEADING1 = TextStyle(
    fontSize: DimensionResource.FONT_18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle SUB_HEADING2 = TextStyle(
    fontSize: DimensionResource.FONT_16,
  );
}
