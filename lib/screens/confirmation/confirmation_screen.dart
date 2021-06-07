import 'package:flutter/material.dart';
import 'package:rideusertesteapp/common/orders/order_tour_tile.dart';
import 'package:rideusertesteapp/model/orderModel.dart';

class ConfirmationScreen extends StatelessWidget {
  ConfirmationScreen(this.orderModel);
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido ${orderModel.formattedId} Confirmado'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    orderModel.formattedId,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    'R\$ ${orderModel.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: orderModel.items.map((e){
                return OrderTourTile(cartTourModel: e);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
