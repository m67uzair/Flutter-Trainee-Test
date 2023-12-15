import 'package:flutter/material.dart';
import 'package:muhammad_uzair_flutter_trainee_test/controllers/products_provider.dart';
import 'package:muhammad_uzair_flutter_trainee_test/views/products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Trainee Test',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductsScreen(),
      ),
    );
  }
}
