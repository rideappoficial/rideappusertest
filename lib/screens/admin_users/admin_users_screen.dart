import 'package:alphabet_list_scroll_view/alphabet_list_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawer.dart';
import 'package:rideusertesteapp/model/adimin_orders_manager.dart';
import 'package:rideusertesteapp/model/admin_users_manager.dart';
import 'package:rideusertesteapp/model/pageManager.dart';

class AdminUsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Usuários'), centerTitle: true),
      body: Consumer<AdminUsersManager>(
        builder: (_, adminUsersManager, __) {
          return AlphabetListScrollView(
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(
                  adminUsersManager.users[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  adminUsersManager.users[index].email,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: (){
                  //print('User Id: ${adminUsersManager.users[index].id}');
                  //print('User name: ${adminUsersManager.users[index].name}');
                  context.read<AdminOrdersManager>().setUserFilter(
                      adminUsersManager.users[index]
                  );
                  context.read<PageManager>().setPage(5);
                },
              );
            },
            highlightTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            strList: adminUsersManager.names,
            indexedHeight: (index) => 60,
            showPreview: true,
          );
        },
      ),
    );
  }
}
