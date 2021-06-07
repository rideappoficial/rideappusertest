import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/cart_manager.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/orderModel.dart';
import 'package:rideusertesteapp/model/orders_manager.dart';
import 'package:rideusertesteapp/model/tourManager.dart';
import 'package:rideusertesteapp/model/toursModel.dart';
import 'package:rideusertesteapp/model/userManager.dart';
import 'package:rideusertesteapp/screens/base/baseScreen.dart';
import 'package:rideusertesteapp/screens/cart/cartScreen.dart';
import 'package:rideusertesteapp/screens/checkout/checkout_screen.dart';
import 'package:rideusertesteapp/screens/confirmation/confirmation_screen.dart';
import 'package:rideusertesteapp/screens/login/loginScreen.dart';
import 'package:rideusertesteapp/screens/orders/orders_screen.dart';
import 'package:rideusertesteapp/screens/signup/signupScreen.dart';
import 'package:rideusertesteapp/screens/tour/tripDetails.dart';

void main() {
  runApp(App());
}
// UserManager
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UserManager(),
            lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TourManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
            create: (_) => CartManager(),
            lazy: false,
            update: (_, userManager, cartManager) =>
                cartManager ..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, OrdersManager>(
          create: (_) => OrdersManager(),
          lazy: false,
          update: (_, userManager, ordersManager) =>
          ordersManager ..updateUser(userManager.user),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ride User App',
        theme: ThemeData(
          //primaryColor: const Color.fromARGB(255, 4, 125, 141),
          primaryColor: const Color(0xFF007292),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          //scaffoldBackgroundColor: const Color.fromARGB(255, 4, 125, 141),
          scaffoldBackgroundColor: const Color(0xFF007292),
          appBarTheme: const AppBarTheme(elevation: 0.0),
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => SignupScreen(),
              );
            case '/tour':
              return MaterialPageRoute(
                builder: (_) => TripDetailsScreen(settings.arguments as TourModel),
              );
            case '/cart':
              return MaterialPageRoute(
                builder: (_) => CartScreen(),
                settings: settings,
              );
            case '/checkout':
              return MaterialPageRoute(
                builder: (_) => CheckoutScreen(),
              );
            case '/confirmation':
              return MaterialPageRoute(
                builder: (_) => ConfirmationScreen(
                    settings.arguments as OrderModel
                ),
              );
            case '/order':
              return MaterialPageRoute(
                builder: (_) => OrdersScreen(),
              );
            case '/confirmation':
              return MaterialPageRoute(
                builder: (_) => ConfirmationScreen(
                    settings.arguments as OrderModel
                ),
              );
            case '/':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
                settings: settings,
              );
          }
        },
      ),
    );
  }
}