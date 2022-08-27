import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shophouse'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ProductsGrid(),
    );
  }
}
