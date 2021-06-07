import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/orderModel.dart';

import 'cancel_order_dialog.dart';
import 'order_tour_tile.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(this.orderModel, {this.showControls = false});
  final OrderModel orderModel;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(orderModel.formattedId,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),),
                  Text('R\$ ${orderModel.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14,
                    ),),
                ],
              ),
              Text('Em transporte',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                  fontSize: 14,
                ),
              ),
              /*
              Text(order.statusText,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: order.status == Status.canceled ? Colors.red : primaryColor,
                  fontSize: 14,
                ),),
              */
            ],
          ),
        children: [
          Column(
            children: orderModel.items.map((e){
              return OrderTourTile(cartTourModel: e);
            }).toList(),
          ),
          /*
          if(showControls && order.status != Status.canceled)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FlatButton(
                    onPressed: (){
                    showDialog(
                        context: context,
                        builder: (_) => CancelOrderDialog(order),
                    );
                  }, child: Text('Cancelar'), textColor: Colors.red,),
                  FlatButton(onPressed: order.back, child: Text('Recuar')),
                  FlatButton(onPressed: order.advance, child: Text('Avançar')),
                  FlatButton(onPressed: (){
                    showDialog(
                      context: context,
                      builder: (_) => ExportAddressDialog(order.address),
                    );
                  }, child: Text('Endereço'), textColor: primaryColor,),
                ],
              ),
            ),
          */
        ],
      ),
    );
  }
}