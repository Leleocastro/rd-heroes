import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';
import 'package:rd_heroes/src/utils/app_routes.dart';
import 'package:transparent_image/transparent_image.dart';

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
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: hero.images.lg,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            hero.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
