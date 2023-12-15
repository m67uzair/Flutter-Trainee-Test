import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  final List<ProductsModel> _allProductsList = [];


  List<ProductsModel> get allProductsList => _allProductsList;

  Future<List<ProductsModel>> fetchAllProductsFromAPI() async {
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
    return _allProductsList;
  }

  Future<List<ProductsModel>> fetchAllProductsFromFile() async {
    _allProductsList.clear();
    String jsonString  = await rootBundle.loadString('assets/files/ProductsData.json');
    var data = jsonDecode(jsonString);
    for(Map i in data){
      _allProductsList.add(ProductsModel.fromJson(i));
    }
    return _allProductsList;
  }

}
