import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/orderModel.dart';

class CancelOrderDialog extends StatelessWidget {
  final OrderModel orderModel;
  CancelOrderDialog(this.orderModel);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cancelar ${orderModel.formattedId} ?'),
      content: const Text('Esta ação não poderá ser desfeita!'),
      actions: [
        FlatButton(
            textColor: Colors.red,
            onPressed: () {
              orderModel.cancel();
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar Pedido'),
        ),
        FlatButton(
            //onPressed: (){ order.cancel()},
            onPressed: (){},
            child: const Text('Cancelar')),
      ],
    );
  }
}