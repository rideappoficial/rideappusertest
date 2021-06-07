import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:rideapp/models/compra.dart';
//import 'package:rideapp/utils/route_generator.dart';

class ChoiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * .3,
            ),
            child: Card(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pagamento",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        Text(
                          "Escolha o Cartão de Crédito/Débito que deseja pagar o passeio:",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        Text(
                          "O valor total para pagamento:\nPasseio: Falésias de Jijocara\nTotal de pessoas: 3\nValor total: R\$ 350,00",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 14.0,),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.ccVisa),
                          title: Text("**** **** **** 1234"),
                          onTap: () {
                            /*
                            Compra compra = Compra();
                            compra.waitingTravel = true;
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteGenerator.ROTA_HOME,
                                    (_) => false,
                              arguments: compra
                            );
                            */
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.ccMastercard),
                          title: Text("**** **** **** 4567"),
                          onTap: () {
                            /*
                            Compra compra = Compra();
                            compra.waitingTravel = true;
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                RouteGenerator.ROTA_HOME,
                                    (_) => false,
                                arguments: compra
                            );
                            */
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.add),
                          title: Text("Adicionar um novo cartão"),
                          onTap: () {
                            /*
                            Navigator.pop(context);
                            Navigator.pushNamed(
                              context,
                              RouteGenerator.ROTA_PAYMENT_ADD
                            );
                            */
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
