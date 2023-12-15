import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsProvider extends ChangeNotifier {
  bool _isLoading = true;
  final List<ProductsModel> _allProductsList = [];

  bool get isLoading => _isLoading;

  List<ProductsModel> get allProductsList => _allProductsList;

  Future<List<ProductsModel>> fetchAllProducts() async {
    _allProductsList.clear();

    try {
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map i in data) {
          _allProductsList.add(ProductsModel.fromJson(i));
          print( "paaaaaaado" + _allProductsList.length.toString());

        }
      } else {
        Fluttertoast.showToast(msg: 'Server Error, status code: ${response.statusCode}');
      }

    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'An error occurred: ${e.toString()}');

    }
      _isLoading = false;
      notifyListeners();
    return _allProductsList;
  }
}
