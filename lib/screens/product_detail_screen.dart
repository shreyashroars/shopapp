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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loadedProducts.imageUrl!,
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 10),
            Text(
              '₹${loadedProducts.price}',
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${loadedProducts.description}',
                softWrap: true,
                style: TextStyle(color: Color.fromARGB(255, 255, 6, 6)),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
