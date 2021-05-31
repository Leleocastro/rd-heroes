import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/pages/hero/widgets/tab_views/tab_view_biography.dart';
import 'package:rd_heroes/src/pages/hero/widgets/tab_views/tab_view_connections.dart';
import 'package:rd_heroes/src/pages/hero/widgets/tab_views/tab_view_powerstats/tab_view_powerstats.dart';
import 'package:rd_heroes/src/pages/hero/widgets/tab_views/tab_view_work.dart';

import 'widgets/tab_item.dart';
import 'widgets/tab_views/tab_view_appearance.dart';

class HeroDetailPage extends StatefulWidget {
  @override
  _HeroDetailPageState createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Heroes hero = ModalRoute.of(context).settings.arguments as Heroes;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height - 90,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                hero.name,
                textAlign: TextAlign.center,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: hero.id,
                    child: Image.network(
                      hero.images.lg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.6),
                          Color.fromRGBO(0, 0, 0, 0),
                        ],
                        begin: Alignment(0, 0.5),
                        end: Alignment(0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                DefaultTabController(
                  length: 5,
                  initialIndex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          child: TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).primaryColor,
                            ),
                            tabs: [
                              TabItem('Appearance'),
                              TabItem('Biography'),
                              TabItem('Power Stats'),
                              TabItem('Work'),
                              TabItem('Connections'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 130,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                        child: TabBarView(
                          children: <Widget>[
                            TabViewAppearance(hero),
                            TabViewBiography(hero),
                            TabViewPowerstats(hero),
                            TabViewWork(hero),
                            TabViewConnections(hero),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
