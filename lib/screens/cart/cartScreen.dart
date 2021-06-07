import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/emptyCart.dart';
import 'package:rideusertesteapp/common/loginCard.dart';
import 'package:rideusertesteapp/common/priceCard.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'compoments/cartTile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Consumer<CartManager>(builder: (_, cartManager, __) {
        if (cartManager.user == null) {
          return LoginCard();
        }
        if (cartManager.items.isEmpty) {
          return EmptyCard(
            iconData: Icons.remove_shopping_cart,
            title: 'Nenhum produto no carrinho',
          );
        }
        return ListView(
          children: [
            Column(
              children: cartManager.items
                  .map((cartTour) => CartTile(cartTourModel: cartTour)).toList(),
            ),
            PriceCard(
              buttonText: 'Continuar para pagamento',
              onPressed: (){
                Navigator.of(context).pushNamed('/checkout');
              },
            ),
          ],
        );
      }),
    );
  }
}
