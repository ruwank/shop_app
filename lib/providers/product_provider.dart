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

  Future<List<Product>> fetchProducts() async {
    final url = Uri.https(
        's3-eu-west-1.amazonaws.com', '/api.themeshplatform.com/products.json');

    try {
      final response = await http.get(url);
      final result = json.decode(response.body) as Map<String, dynamic>;
      final List data = result['data'];

      return data.map((prodData) => Product.fromJson(prodData)).toList();
    } catch (error) {
      throw HttpException("Something went wrong");
    }
  }

  Future<void> fetchAndSetProducts() async {
    try {
      _items = await fetchProducts();
      print(_items.length);
      notifyListeners();
    } catch (error) {
      throw HttpException("Something went wrong");
    }
  }
}
