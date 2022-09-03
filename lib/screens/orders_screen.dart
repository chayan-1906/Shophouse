import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/orders.dart' show Orders;
import 'package:shop_app_maximilian/widgets/app_drawer.dart';

import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orders orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(orderItem: orderData.orders[index]);
        },
      ),
    );
  }
}
