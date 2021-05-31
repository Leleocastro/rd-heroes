import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/controllers/hero_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'hero_grid_item.dart';

class HeroGrid extends StatefulWidget {
  @override
  _HeroGridState createState() => _HeroGridState();
}

class _HeroGridState extends State<HeroGrid> {
  @override
  Widget build(BuildContext context) {
    final heroesProvider = Provider.of<HeroesController>(context);
    final heroes = heroesProvider.heroes;
    final sizeScreen = MediaQuery.of(context).size.width;
    int size;

    if (sizeScreen < 800) {
      setState(() {
        size = 2;
      });
    } else if (sizeScreen < 1000) {
      setState(() {
        size = 3;
      });
    } else {
      setState(() {
        size = 5;
      });
    }
    return StaggeredGridView.countBuilder(
        crossAxisCount: size,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        padding: const EdgeInsets.all(10),
        itemCount: heroes.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: heroes[i],
              child: HeroGridItem(),
            ),
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
        });
  }
}
