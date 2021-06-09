import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTourScreen extends StatelessWidget {

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
      body: Container(),
    );
  }
}