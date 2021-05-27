import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/utils/app_routes.dart';

class HeroGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Heroes hero = Provider.of<Heroes>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.HERO_DETAIL,
              arguments: hero,
            );
          },
          child: Hero(
            tag: hero.id,
            child: FadeInImage(
              placeholder: AssetImage('assets/images/product-placeholder.png'),
              image: NetworkImage(hero.images.md),
              fit: BoxFit.cover,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Heroes>(
            builder: (ctx, hero, _) => IconButton(
              onPressed: () {
                // hero.toggleFavorite(auth.token, auth.userId);
              },
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.ac_unit),
            ),
          ),
          title: Text(
            hero.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
