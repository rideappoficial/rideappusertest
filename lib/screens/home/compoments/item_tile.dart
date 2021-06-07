import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/section.dart';
import 'package:rideusertesteapp/model/section_item.dart';
import 'package:rideusertesteapp/model/tourManager.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({this.item});
  final SectionItem item;

  // Dentro de função utilizar  --> read
  // Dentro do build utilizar  --> watch

  @override
  Widget build(BuildContext context) {
    final homeManager = context.watch<HomeManager>();
    return GestureDetector(
      /*
      onLongPress: homeManager.editing ? (){
        showDialog(
          context: context,
          builder: (_) {
            final tour = context.read<TourManager>().findProductById(item.tour);
            return AlertDialog(
              title: Text('Editar Item'),
              content: tour != null
                  ? ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.network(tour.images.first),
                title: Text(tour.title),
                //subtitle: Text('R\$ ${product.basePrice.toStringAsFixed(2)}'),
                subtitle: Text('R\$ ${tour.unitPrice.toStringAsFixed(2)}'),
              )
                  : null,
              actions: [
                FlatButton(
                  onPressed: (){
                    context.read<Section>().removeItem(item);
                    Navigator.of(context).pop();
                  },
                  textColor: Colors.red,
                  child: Text('Excluir'),
                ),
                FlatButton(
                  onPressed: () async {
                    if(tour != null){
                      //item.tour = null;
                    } else {
                      //final TourModel tour = await Navigator.of(context).pushNamed('/select_product') as TourModel;
                      //item.tour = tour?.id;
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(tour != null ? 'Desvincular' : 'Vincular'),
                ),
              ],
            );
          },
        );
      } : null,
      */
      onTap: () {
        if (item.tour != null) {
          final tour =
          context.read<TourManager>().findProductById(item.tour);
          if (tour != null) {
            Navigator.of(context).pushNamed('/tour', arguments: tour);
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: item.image is String
            ? FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: item.image as String,
          fit: BoxFit.cover,
        )
            : Image.file(item.image as File, fit: BoxFit.fill),
      ),
    );
  }
}
