import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawerHeader.dart';
import 'package:rideusertesteapp/common/drawerTile.dart';
import 'package:rideusertesteapp/model/userManager.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 203, 236, 241),
                      Colors.white,
                    ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(iconData: Icons.home, title: 'Inicio', page: 0),
              DrawerTile(iconData: Icons.list, title: 'Passeios', page: 1),
              DrawerTile(iconData: Icons.playlist_add_check, title: 'Meus Pedidos', page: 2),
              DrawerTile(iconData: Icons.location_on, title: 'Lojas', page: 3),
              Consumer<UserManager>(
                builder: (_, usermanager, __){
                  if(usermanager.adminEnabled){
                    return Column(
                      children: [
                        const Divider(),
                        DrawerTile(iconData: Icons.person, title: 'Usuários', page: 4),
                        DrawerTile(iconData: Icons.dashboard_outlined, title: 'Pedidos', page: 5),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
