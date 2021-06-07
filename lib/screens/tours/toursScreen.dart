import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawer.dart';
import 'package:rideusertesteapp/model/tourManager.dart';
import 'package:rideusertesteapp/model/userManager.dart';
import 'compoments/searchDialog.dart';
import 'compoments/tourListTile.dart';

class ToursScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TourManager>(builder: (_, tourManager, __) {
          if (tourManager.search.isEmpty) {
            return const Text('Passeios');
          } else {
            return LayoutBuilder(builder: (_, constraints) {
              return GestureDetector(
                onTap: () async {
                  final search = await showDialog<String>(
                    context: context,
                    builder: (_) =>
                        SearchDialog(initialText: tourManager.search),
                  );
                  if (search != null) {
                    tourManager.search = search;
                  }
                },
                child: Container(
                  width: constraints.biggest.width,
                  child: Text(
                    tourManager.search,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            });
          }
        }),
        centerTitle: true,
        actions: <Widget>[
          Consumer<TourManager>(builder: (_, tourManager, __) {
            if (tourManager.search.isEmpty) {
              return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                      context: context,
                      builder: (_) =>
                          SearchDialog(initialText: tourManager.search),
                    );
                    if (search != null) {
                      tourManager.search = search;
                    }
                  });
            } else {
              return IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () async {
                    tourManager.search = '';
                  });
            }
          }),
          Consumer<UserManager>(
            builder: (_, userManager, __) {
              if (userManager.adminEnabled) {
                return IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      //Navigator.of(context).pushNamed(
                        //'/edit_product',
                      //);
                    });
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Consumer<TourManager>(
        builder: (_, tourManager, __) {
          final filteredTours = tourManager.filteredTours;
          return ListView.builder(
            itemCount: filteredTours.length,
            itemBuilder: (_, index) {
              return TourListTile(
                  tourModel: filteredTours[index]
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.of(context).pushNamed('/cart');
          }),
    );
  }
}
