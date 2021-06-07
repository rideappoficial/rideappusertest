import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/section.dart';
import 'package:rideusertesteapp/model/section_item.dart';

class AddTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final section = context.watch<Section>();
    void onImageSelected(File file){
      section.addItem(SectionItem(image: file));
      Navigator.of(context).pop();
    }
    return AspectRatio(
      aspectRatio: 1,
      child: GestureDetector(
        onTap: () {
          /*
          if (Platform.isAndroid) {
            showModalBottomSheet(
                context: context,
                builder: (context) => ImageSourceSheet(onImageSelected: onImageSelected),
            );
          } else {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => ImageSourceSheet(onImageSelected: onImageSelected),
            );
          }
          */
        },
        child: Container(
          color: Colors.white.withAlpha(30),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
