import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String? id;
  final double? price;
  final int? quantity;
  final String? title;
  final String? productId;
  CartItem({this.id, this.price, this.quantity, this.title, this.productId});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
          color: const Color.fromARGB(255, 240, 164, 164),
          child: const Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          alignment: Alignment.centerLeft),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId!);
      },
      child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: FittedBox(
                        child: Text('₹' + price!.toStringAsFixed(2)))),
              ),
              title: Text(title!),
              subtitle: Text('Total' + (price! * quantity!).toStringAsFixed(2)),
              trailing: Text(quantity.toString() + 'x'),
            ),
          )),
    );
  }
}
