import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/section.dart';

class AddSectionWidget extends StatelessWidget {
  const AddSectionWidget(this.homeManager);
  final HomeManager homeManager;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: FlatButton(
            onPressed: () {
              homeManager.addSection(Section(type: 'List'));
            },
            child: Text(
              'Adicionar Lista',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () {
              homeManager.addSection(Section(type: 'Staggered'));
            },
            child: Text(
              'Adicionar Grade',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
