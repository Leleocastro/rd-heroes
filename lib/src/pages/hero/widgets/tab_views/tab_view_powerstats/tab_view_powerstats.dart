import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/pages/hero/widgets/tab_views/tab_view_powerstats/chart_bar_widget.dart';

class TabViewPowerstats extends StatelessWidget {
  final Heroes hero;
  TabViewPowerstats(this.hero);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ChartBarWidget(
              hero.powerStats.intelligence,
              'Intelligence',
              Colors.blue,
            ),
            SizedBox(height: 20),
            ChartBarWidget(
              hero.powerStats.strength,
              'Strengh',
              Colors.red,
            ),
            SizedBox(height: 20),
            ChartBarWidget(
              hero.powerStats.speed,
              'Speed',
              Colors.green,
            ),
            SizedBox(height: 20),
            ChartBarWidget(
              hero.powerStats.durability,
              'Durability',
              Colors.amber,
            ),
            SizedBox(height: 20),
            ChartBarWidget(
              hero.powerStats.power,
              'Power',
              Colors.purple,
            ),
            SizedBox(height: 20),
            ChartBarWidget(
              hero.powerStats.combat,
              'Combat',
              Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }
}
