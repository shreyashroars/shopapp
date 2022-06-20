import 'package:flutter/material.dart';
import 'package:shopapp/providers/order.dart';
import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routename = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Spacer(),
                Chip(
                  label: Text('₹' + cart.totalAmt.toStringAsFixed(2)),
                  backgroundColor: Colors.green,
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false)
                          .addOrder(cart.items.values.toList(), cart.totalAmt);
                      cart.clear();
                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: cart.itemlength,
                itemBuilder: (ctx, i) => ci.CartItem(
                    id: cart.items.values.toList()[i].id,
                    productId: cart.items.keys.toList()[i],
                    title: cart.items.values.toList()[i].title,
                    quantity: cart.items.values.toList()[i].quantity,
                    price: cart.items.values.toList()[i].price)))
      ]),
    );
  }
}
