import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';
import '../models/http_exception.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.https(
        's3-eu-west-1.amazonaws.com', '/api.themeshplatform.com/products.json');

    try {
      final response = await http.get(url);
      final result = json.decode(response.body) as Map<String, dynamic>;
      final data = result['data'];
      final List<Product> loadedProducts = [];

      for (final prodData in data) {
        loadedProducts.add(Product(
          id: prodData['id'],
          sku: prodData['SKU'],
          name: prodData['name'],
          brandName: prodData['brandName'],
          mainImage: prodData['mainImage'],
          amount: double.parse(prodData['price']['amount']),
          currency: prodData['price']['currency'],
          sizes: prodData['sizes'].cast<String>(),
          stockStatus: prodData['stockStatus'],
          colour: prodData['colour'],
          description: prodData['description'],
        ));
      }
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw HttpException("Something went wrong");
    }
  }
}
