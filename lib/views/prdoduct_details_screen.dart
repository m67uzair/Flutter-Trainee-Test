import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/custom_app_bar.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/custom_icon_button.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/custom_rating_bar.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/app_colors.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/string_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/style_constants.dart';
import 'package:muhammad_uzair_flutter_trainee_test/models/products_model.dart';
import 'package:muhammad_uzair_flutter_trainee_test/utils/extension_functions.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductsModel productsModel;

  const ProductDetailsScreen({
    super.key,
    required this.productsModel,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String productTitle = widget.productsModel.title ?? "";
    String productImage = widget.productsModel.image ?? "";
    String productDescription = widget.productsModel.description ?? "";
    String productCategory = widget.productsModel.category?.initCaps() ?? "";
    double productPrice = widget.productsModel.price?.toDouble() ?? 0;
    double productRating = widget.productsModel.rating?.rate?.toDouble() ?? 0;
    int productRateCount = widget.productsModel.rating?.count ?? 0;

    return Scaffold(
      appBar: customAppBar(appBarTitle: StringResource.PRODUCT_DETAILS),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DimensionResource.PADD_15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: DimensionResource.D_10),
              Container(
                height: 380,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.network(productImage),
              ),
              const SizedBox(height: DimensionResource.D_10),
              Text(
                productTitle,
                style: StyleConstants.HEADING1.copyWith(color: Colors.black),
              ),
              const SizedBox(height: DimensionResource.D_10),
              Text(productCategory, style: StyleConstants.SUB_HEADING1,),
              const SizedBox(height: DimensionResource.D_10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$productPrice\$",
                    style: StyleConstants.HEADING1.copyWith(color: AppColors.primaryColor),
                  ),
                  const Icon(Icons.favorite_border),
                ],
              ),
              const SizedBox(height: DimensionResource.D_10),
              RatingBar(
                rating: productRating,
                ratingCount: productRateCount,
              ),
              const SizedBox(height: DimensionResource.D_10),
              Text(
                productDescription,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: DimensionResource.FONT_16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: DimensionResource.D_20),
              Align(
                alignment: Alignment.centerRight,
                child: customIconButton(
                  onPressed: () {},
                  icon: Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: DimensionResource.D_50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
