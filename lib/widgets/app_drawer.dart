import 'package:flutter/material.dart';
import 'package:shop_app_maximilian/screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Shophouse'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: const Icon(Icons.shop_rounded),
            title: const Text('Shop'),
            onTap: () {
              /*Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return const OrdersScreen();
                }),
              );*/
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment_rounded),
            title: const Text('Orders'),
            onTap: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const OrdersScreen();
                }),
              );*/
              Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
