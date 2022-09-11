import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/products.dart';
import 'package:shop_app_maximilian/screens/edit_product_screen.dart';
import 'package:shop_app_maximilian/widgets/app_drawer.dart';
import 'package:shop_app_maximilian/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const EditProductScreen();
                }),
              );
            },
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: productsData.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                UserProductItem(
                  id: productsData.items[index].id,
                  title: productsData.items[index].title,
                  imageURL: productsData.items[index].imageURL,
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
