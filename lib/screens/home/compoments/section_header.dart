import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customIconButton.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/section.dart';

class SectionHeader extends StatelessWidget {
  SectionHeader({this.section});
  final Section section;

  @override
  Widget build(BuildContext context) {
    final homeManager = context.watch<HomeManager>();
    final section = context.watch<Section>();
    if(homeManager.editing){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: section.name,
                  decoration: InputDecoration(
                    hintText: 'Titulo',
                    isDense: true,
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  onChanged: (text) => section.name = text,
                ),
              ),
              CustomIconButton(
                iconData: Icons.remove,
                color: Colors.white,
                onTap: (){
                  homeManager.removeSection(section);
                },
              ),
            ],
          ),
          if(section.error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                section.error,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amberAccent,
                ),
              ),
            ),
        ],
      );
    }else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          section.name ?? "",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
    }
  }
}
