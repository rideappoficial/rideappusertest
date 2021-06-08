import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/priceCard.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'package:rideusertesteapp/model/checkout_manager.dart';
import 'package:rideusertesteapp/model/credit_card.dart';
import 'package:rideusertesteapp/model/pageManager.dart';
import 'component/cpf_field.dart';
import 'component/credit_card_widget.dart';

class CheckoutScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CreditCard creditCard = CreditCard();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<CartManager, CheckoutManager>(
      create: (_) => CheckoutManager(),
      update: (_, cartManager, checkoutManager) =>
          checkoutManager..updateCart(cartManager),
      lazy: false,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('Pagamento'),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Consumer<CheckoutManager>(
            builder: (_, checkoutManager, __) {
              if (checkoutManager.loading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Processando seu pagamento',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                );
              }
              return Form(
                key: formKey,
                child: ListView(
                  children: [
                    CreditCardWidget(creditCard),
                    CPFField(),
                    PriceCard(
                      buttonText: 'Finalizar Pedido',
                      onPressed: () {
                        checkoutManager.checkout(
                          onSuccess: (orderModel) {
                            Navigator.of(context).popUntil(
                                (route) => route.settings.name == '/');
                            //context.read<PageManager>().setPage(2);
                            Navigator.of(context).pushNamed(
                              '/confirmation',
                              arguments: orderModel,
                            );
                          },
                        );
                        //if (formKey.currentState.validate()) {
                        //formKey.currentState.save();

                        /*
                        checkoutManager.checkout(
                          //creditCard: creditCard,
                          onStockFail: (e) {
                            Navigator.of(context).popUntil(
                                (route) => route.settings.name == '/cart');
                          },
                          onSuccess: (order) {
                            Navigator.of(context).popUntil(
                                (route) => route.settings.name == '/');
                            Navigator.of(context)
                                .pushNamed('/confirmation', arguments: order);
                          },
                        );
                        */

                        //}
                      }, //checkoutManager.checkout(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
