import 'package:flutter/material.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';

enum SelectedOptions { Favourites, All }

class ProductOverview extends StatefulWidget {
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('ShopApp'), actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (SelectedOptions selectedValue) {
            if (selectedValue == SelectedOptions.Favourites) {
              _showOnlyFavourites = true;
            } else {
              _showOnlyFavourites = false;
            }
            setState(() {});
          },
          itemBuilder: (_) => [
            const PopupMenuItem(
                child: Text('Only Favourites'),
                value: SelectedOptions.Favourites),
            const PopupMenuItem(
                child: Text('ShowAll'), value: SelectedOptions.All)
          ],
        ),
        Consumer<Cart>(
            builder: (_, cart, ch) =>
                Badge(child: ch!, value: cart.itemlength.toString()),
            child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routename);
                }))
      ]),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
