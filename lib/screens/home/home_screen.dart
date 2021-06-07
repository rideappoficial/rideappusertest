import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rideusertesteapp/common/customDrawer.dart';
import 'package:rideusertesteapp/model/home_manager.dart';
import 'package:rideusertesteapp/model/userManager.dart';
import 'compoments/add_section_widget.dart';
import 'compoments/section_list.dart';
import 'compoments/section_staggered.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.teal,
                const Color.fromARGB(255, 203, 236, 241),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Rider App',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                  ),
                  Consumer2<UserManager, HomeManager>(
                      builder: (_, userManager, homeManager, __) {
                    if (userManager.adminEnabled && !homeManager.loading) {
                      if (homeManager.editing) {
                        return PopupMenuButton(
                          onSelected: (e) {
                            if (e == 'Salvar') {
                              homeManager.saveEditing();
                            } else {
                              homeManager.descartEditing();
                            }
                          },
                          itemBuilder: (_) {
                            return ['Salvar', 'Descartar'].map((e) {
                              return PopupMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList();
                          },
                        );
                      } else {
                        return IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: homeManager.enterEditting);
                      }
                    } else
                      return Container();
                  }),
                ],
              ),
              Consumer<HomeManager>(builder: (_, homeManager, __) {
                if (homeManager.loading) {
                  return SliverToBoxAdapter(
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                }
                final List<Widget> children =
                    homeManager.sections.map<Widget>((section) {
                  switch (section.type) {
                    case 'List':
                      return SectionList(section: section);
                      break;
                    case 'Staggered':
                      return SectionStaggered(section: section);
                      break;
                    default:
                      return Container();
                  }
                }).toList();

                if (homeManager.editing)
                  children.add(AddSectionWidget(homeManager));

                return SliverList(
                  delegate: SliverChildListDelegate(children),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
