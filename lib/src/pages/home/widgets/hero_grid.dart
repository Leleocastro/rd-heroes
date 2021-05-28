import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'hero_grid_item.dart';

class HeroGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesProvider = Provider.of<Heroes>(context);
    final heroes = heroesProvider.heroes;
    return StaggeredGridView.countBuilder(
        crossAxisCount: 2,
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
