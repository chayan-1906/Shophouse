import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/product.dart';
import 'package:shop_app_maximilian/screens/product_detail_screen.dart';

import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (BuildContext context, Product product, _) {
              return IconButton(
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                color: Colors.deepOrangeAccent,
                icon: product.isFavorite
                    ? const Icon(Icons.favorite_rounded)
                    : const Icon(Icons.favorite_border_rounded),
              );
            },
            child: const Text('Never changes'),
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Item added to cart!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          title: Text(product.title, textAlign: TextAlign.center),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ProductDetailScreen(productId: product.id);
              }),
            );
          },
          child: Image.network(product.imageURL, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
