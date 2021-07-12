import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawer.dart';

import 'package:rideusertesteapp/model/pageManager.dart';
import 'package:rideusertesteapp/model/userManager.dart';
import 'package:rideusertesteapp/screens/admin_orders/admin_orders_screen.dart';
import 'package:rideusertesteapp/screens/admin_users/admin_users_screen.dart';
import 'package:rideusertesteapp/screens/home/home_screen.dart';
import 'package:rideusertesteapp/screens/login/loginScreen.dart';
import 'package:rideusertesteapp/screens/orders/orders_screen.dart';
import 'package:rideusertesteapp/screens/tours/toursScreen.dart';

class BaseScreen extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          return PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              ToursScreen(),
              OrdersScreen(),
              Scaffold(
                drawer: CustomDrawer(),
                appBar: AppBar(
                  title: Text('#4'),
                ),
              ),
              if(userManager.adminEnabled)
                ... [
                  AdminUsersScreen(),
                  AdminOrdersScreen(),
                ],
            ],
          );
        },
      ),
    );
  }
}
