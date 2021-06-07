import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/pageManager.dart';
import 'package:rideusertesteapp/model/userManager.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(builder: (_, userManager, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Ride App',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            Text(
              'Oi, ${userManager.user?.name ?? ''}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                if (userManager.isLoggedIn) {
                  context.read<PageManager>().setPage(0);
                  userManager.signout();
                } else {
                  Navigator.of(context).pushNamed('/login');
                }
              },
              child: Text(
                userManager.isLoggedIn ? 'Sair' : 'Entre ou cadastra-se >',
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      }),
    );
  }
}
