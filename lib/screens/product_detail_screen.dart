import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String? title;
  // ProductDetailScreen(this.title);
  static const routename = '/product_detail_screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProducts =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProducts.title!)),
    );
  }
}
