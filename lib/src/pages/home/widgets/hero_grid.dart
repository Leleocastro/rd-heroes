import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

import 'hero_grid_item.dart';

class HeroGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final heroesProvider = Provider.of<Heroes>(context);
    final heroes = heroesProvider.heroes;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: heroes.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: heroes[i],
        child: HeroGridItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
