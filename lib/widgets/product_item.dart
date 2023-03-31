import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_shop_app/models/product.dart';
import 'package:ecommerce_shop_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        header: Text(
          product.name,
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        footer: GridTileBar(
          title: Text(
            '${product.amount} ${product.currency}',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).primaryColorDark,
            onPressed: () {
              cart.addItem(product.id, product.amount, product.name);
            },
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
          },
          child: CachedNetworkImage(
            imageUrl: product.mainImage,
          ),
        ),
      ),
    );
  }
}
