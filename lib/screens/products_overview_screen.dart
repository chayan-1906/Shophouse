import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/cart.dart';
import 'package:shop_app_maximilian/screens/cart_screen.dart';
import 'package:shop_app_maximilian/widgets/app_drawer.dart';
import 'package:shop_app_maximilian/widgets/badge.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shophouse'),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, Widget child) {
              return Badge(
                value: cartData.itemCount.toString(),
                child: child,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const CartScreen();
                  }),
                );
              },
              icon: const Icon(Icons.shopping_cart_rounded),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert_rounded),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Only Favourites'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('Show All'),
                ),
              ];
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(showFavorites: _showFavoritesOnly),
    );
  }
}
