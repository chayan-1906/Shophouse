import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_maximilian/providers/cart.dart';
import 'package:shop_app_maximilian/providers/products.dart';
import 'package:shop_app_maximilian/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Products()),
        ChangeNotifierProvider(create: (BuildContext context) => Cart()),
      ],
      child: MaterialApp(
        title: 'Shophouse',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: GoogleFonts.nunito().fontFamily,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
          ),
        ),
        home: const ProductOverviewScreen(),
      ),
    );
  }
}
