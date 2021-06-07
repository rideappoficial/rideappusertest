import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawer.dart';
import 'package:rideusertesteapp/common/emptyCart.dart';
import 'package:rideusertesteapp/common/loginCard.dart';
import 'package:rideusertesteapp/common/orders/order_tile.dart';
import 'package:rideusertesteapp/model/orders_manager.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
        centerTitle: true,
      ),
      body: Consumer<OrdersManager>(
        builder: (_, orderManager, __){
          if(orderManager.user == null){
            return LoginCard();
          }
          if(orderManager.ordersModel.isEmpty){
            return EmptyCard(
              title: 'Nenhuma compra encontrada',
              iconData: Icons.border_clear,
            );
          }
          return ListView.builder(
              itemCount: orderManager.ordersModel.length,
              itemBuilder: (_, index){
                return OrderTile(
                  orderManager.ordersModel.reversed.toList()[index]
                );
            }
          );
        },
      ),
    );
  }
}
