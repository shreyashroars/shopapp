import 'package:flutter/material.dart';
import 'package:shopapp/screens/products_overview_screens.dart';
import 'package:shopapp/widgets/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.orange,
              fontFamily: 'Lato'),
          home: ProductOverview(),
          routes: {
            ProductDetailScreen.routename: (ctx) => ProductDetailScreen(),
          }),
    );
  }
}
