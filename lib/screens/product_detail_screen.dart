import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({
    Key key,
    @required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: MediaQuery.of(context).size.width,
              child: Image.network(loadedProduct.imageURL, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10.0),
            Text(
              '\$${loadedProduct.price}',
              style: const TextStyle(color: Colors.grey, fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
