import 'package:flutter/material.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/section.dart';
import 'addTileWidget.dart';
import 'item_tile.dart';
import 'section_header.dart';
import 'package:provider/provider.dart';

class SectionList extends StatelessWidget {
  const SectionList({this.section});
  final Section section;

  @override
  Widget build(BuildContext context) {
    final homeManager = context.watch<HomeManager>();
    return ChangeNotifierProvider.value(
      value: section,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(),
            SizedBox(
              height: 150,
              child: Consumer<Section>(builder: (_, section, __) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => SizedBox(width: 4),
                  itemCount: homeManager.editing
                      ? section.items.length + 1
                      : section.items.length,
                  itemBuilder: (context, index) {
                    if (index < section.items.length)
                      return ItemTile(item: section.items[index]);
                    else
                      return AddTileWidget();
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
