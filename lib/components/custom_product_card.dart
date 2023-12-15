import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/string_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/style_constants.dart';
import 'package:muhammad_uzair_flutter_trainee_test/models/products_model.dart';
import 'package:muhammad_uzair_flutter_trainee_test/utils/extension_functions.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  //passing ProductModel object from ProductScreen to save an api call
  final ProductsModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final String productTitle = widget.product.title ?? "";
    final String productImageURL = widget.product.image ?? "";
    final int productRatingCount = widget.product.rating?.count ?? 0;
    final double productRating = widget.product.rating?.rate?.toDouble() ?? 0;
    final double productPrice = widget.product.price?.toDouble() ?? 0;
    final String category = widget.product.category ?? "";

    return Card(
      elevation: 1,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: Image.network(productImageURL),
            ),
            const SizedBox(height: DimensionResource.D_5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  StringResource.AVAILABLE_IN_STOCK,
                  style: StyleConstants.SUB_HEADING,
                ),
                Text('($productRatingCount)'),
              ],
            ),
            const SizedBox(height: DimensionResource.D_5),
            Text(
              productTitle,
              maxLines: 2,
              style: StyleConstants.HEADING2.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: DimensionResource.D_5),
            Text(
              category.initCaps(),
              style: const TextStyle(fontSize: DimensionResource.FONT_16),
            ),
            const SizedBox(height: DimensionResource.D_5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$productPrice\$",
                  style: StyleConstants.HEADING2.copyWith(
                    fontSize: DimensionResource.FONT_20,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      "$productRating",
                      style: StyleConstants.HEADING2,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}