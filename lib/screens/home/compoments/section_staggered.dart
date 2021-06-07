import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/section.dart';
import 'addTileWidget.dart';
import 'item_tile.dart';
import 'section_header.dart';

class SectionStaggered extends StatelessWidget {
  const SectionStaggered({this.section});
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
            Consumer<Section>(builder: (_, section, __) {
              return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeManager.editing
                    ? section.items.length + 1
                    : section.items.length,
                itemBuilder: (_, index) {
                  if (index < section.items.length) {
                    return ItemTile(
                      item: section.items[index],
                    );
                  } else {
                    return AddTileWidget();
                  }
                },
                staggeredTileBuilder: (index) => StaggeredTile.count(
                  2, // Horizontal
                  index.isEven ? 2 : 1, // Vertical
                ),
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              );
            }),
          ],
        ),
      ),
    );
  }
}
