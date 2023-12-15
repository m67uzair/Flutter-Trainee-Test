import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/product_card.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/app_colors.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/dimension_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/string_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/controllers/products_provider.dart';
import 'package:muhammad_uzair_flutter_trainee_test/models/products_model.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late ProductsProvider _productsProvider;

  @override
  void initState() {
    super.initState();
    _productsProvider = Provider.of<ProductsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          StringResource.PRODUCTS,
          style: TextStyle(
            fontSize: DimensionResource.FONT_25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        toolbarHeight: DimensionResource.D_60,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: const [
          Icon(
            Icons.shopping_cart_rounded,
          ),
          SizedBox(width: DimensionResource.D_20),
          Icon(
            Icons.menu_rounded,
            size: DimensionResource.D_32,
          ),
          SizedBox(width: DimensionResource.D_10),
        ],
      ),
      body: FutureBuilder(
          future: _productsProvider.fetchAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: 20,
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250, mainAxisExtent: 290),
                  itemBuilder: (context, index) {
                    ProductsModel product = snapshot.data?[index] ?? ProductsModel();
                    return ProductCard(
                      product: product,
                    );
                  });
            } else {
              return const Center(child: Text('An Error occurred, check your connection and try again.'));
            }
          }),
    );
  }
}
