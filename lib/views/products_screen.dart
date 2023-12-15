import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/custom_app_bar.dart';
import 'package:muhammad_uzair_flutter_trainee_test/components/product_card.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/app_colors.dart';
import 'package:muhammad_uzair_flutter_trainee_test/constants/string_resource.dart';
import 'package:muhammad_uzair_flutter_trainee_test/controllers/products_provider.dart';
import 'package:muhammad_uzair_flutter_trainee_test/models/products_model.dart';

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
      appBar: buildAppBar(appBarTitle: StringResource.PRODUCTS),
      body: FutureBuilder(
          future: _productsProvider.fetchAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ));
            } else if (snapshot.hasData) {
              List<ProductsModel> productsSnapshot = snapshot.data ?? [];
              return buildProductsGrid(productsSnapshot: productsSnapshot);
            } else {
              return const Center(child: Text(StringResource.ERROR_OCCURRED));
            }
          }),
    );
  }
}

class buildProductsGrid extends StatelessWidget {
  const buildProductsGrid({
    super.key,
    required this.productsSnapshot,
  });

  final List<ProductsModel> productsSnapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productsSnapshot.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250, mainAxisExtent: 290),
        itemBuilder: (context, index) {
          ProductsModel product = productsSnapshot[index];
          return ProductCard(
            product: product,
          );
        });
  }
}
