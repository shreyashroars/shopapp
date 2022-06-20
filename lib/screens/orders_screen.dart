import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_items.dart';

class OrdersScreen extends StatelessWidget {
  static const routename = '/orderscreen';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
