import 'package:flutter/material.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final String? imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    print('shreyash hai hero');
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailScreen.routename,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            )),
        footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                  icon: product.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                  color: Theme.of(context).accentColor),
            ),
            backgroundColor: Colors.black45,
            title: Text(
              product.title!,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                icon: const Icon(Icons.shopping_cart_sharp),
                onPressed: () {
                  cart.additems(product.id!, product.price!, product.title!);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Item added successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green),
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeSingleItem(product.id!);
                        },
                      ),
                    ),
                  );
                },
                color: Theme.of(context).accentColor)),
      ),
    );
  }
}
