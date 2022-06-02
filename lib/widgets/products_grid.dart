import 'package:flutter/material.dart';
import 'package:shopapp/widgets/product_item.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        // SliverGridDelegateWithFixedCrossAxisCount this tells the number of columns u want Here crossAxisCount=2 therefore 2 columns are set
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              // create: (c) => products[i],
              value: products[i],
              child: ProductItem(
                  // products[i].id,
                  //  products[i].title,
                  //   products[i].imageUrl
                  ),
            ));
  }
}
