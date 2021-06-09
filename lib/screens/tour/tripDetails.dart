import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'package:rideusertesteapp/model/toursModel.dart';
import 'package:rideusertesteapp/model/userManager.dart';
import 'package:rideusertesteapp/screens/tour/widgets/description_panel.dart';
import 'package:rideusertesteapp/screens/tour/widgets/details_trip.dart';
import 'package:rideusertesteapp/screens/tour/widgets/location_panel.dart';
import 'package:rideusertesteapp/screens/tour/widgets/main_panel.dart';
import 'package:rideusertesteapp/screens/tour/widgets/user_panel.dart';

// = ProductScreen (DC)
// Ajustar - ver video # 36
class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen(this.tourModel);
  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return ChangeNotifierProvider.value(
      value: tourModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Detalhes"),
          actions: [
            Consumer<UserManager>(
              builder: (_, userManager, __){
                if(userManager.adminEnabled){
                  return IconButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacementNamed('/edit_tour');
                      },
                      icon: Icon(Icons.edit)
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Carousel(
                images: [
                  NetworkImage("https://www.igaratur.com.br/wp-content/uploads/2016/11/jericoacoara2_grande-768x535.jpeg"),
                  NetworkImage("https://jujunatrip.com/wp-content/uploads/2020/08/Lagoa-Paraiso-near-Jericoacoara-Brazil-800x551.jpg"),
                  NetworkImage("https://abrilviagemeturismo.files.wordpress.com/2017/04/pedra-furada-uma-das-principais-atraccca7occ83es-em-jericoacoara-cearacc81.jpg?quality=70&strip=info&w=680&h=453&crop=1"),
                ],
                dotSize: 4,
                dotSpacing: 15,
                dotBgColor: Colors.transparent,
                dotColor: Theme.of(context).primaryColor,
                autoplay: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainPanel(),
                  Divider(),
                  DescriptionPanel(),
                  // - -
                  Divider(),
                  Consumer2<UserManager, TourModel>(
                    builder: (_, userManager, tourModel, __) {
                      return SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          color: primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (userManager.isLoggedIn) {
                              context.read<CartManager>().addToCart(tourModel);
                              Navigator.of(context).pushNamed('/cart');
                            } else {
                              Navigator.of(context).pushNamed('/login');
                            }
                          },
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Adicionar ao Carrinho'
                                : 'Entre para Comprar',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  // - -
                  Divider(),
                  DetailsTrip(),
                  Divider(),
                  LocationPanel(),
                  Divider(),
                  UserPanel(),
                  //Divider(),
                  //BuyPanel(),
                  SizedBox(height: 20),
                  // Temp fora - agora em outra posição ...
                  /*
                  Consumer<UserManager>(
                    builder: (_, userManager, __) {
                      return SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          color: primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if (userManager.isLoggedIn) {
                              context.read<CartManager>().addToCart(tourModel);
                              Navigator.of(context).pushNamed('/cart');
                            } else {
                              Navigator.of(context).pushNamed('/login');
                            }
                          },
                          child: Text(
                            userManager.isLoggedIn
                                ? 'Adicionar ao Carrinho'
                                : 'Entre para Comprar',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
