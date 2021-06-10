import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/toursModel.dart';

class EditTourScreen extends StatelessWidget {
  //const EditTourScreen({this.tourModel});
  const EditTourScreen(this.tourModel);
  final TourModel tourModel;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Passeio'),
        centerTitle: true,
        actions: <Widget>[
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //ImagesForm()
        ],
      ),
    );
  }
}