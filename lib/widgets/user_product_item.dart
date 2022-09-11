import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/products.dart';
import 'package:shop_app_maximilian/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;

  const UserProductItem({
    Key key,
    this.id,
    this.title,
    this.imageURL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Products products = Provider.of<Products>(context, listen: false);

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageURL)),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            /// edit
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductScreen(id: id),
                  ),
                );
              },
              icon: const Icon(Icons.edit_rounded),
              color: Theme.of(context).primaryColor,
            ),

            /// delete
            IconButton(
              onPressed: () {
                products.deleteProduct(id);
              },
              icon: const Icon(Icons.delete_rounded),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
