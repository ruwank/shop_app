import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../providers/product_provider.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final productsData =  Provider.of<ProductProvider>(context);
  final productList = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) => ProductItem(
        product: productList[index],
      ),
    );
  }
}
