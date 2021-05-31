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
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: hero.id,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: hero.images.sm,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.7),
                        Color.fromRGBO(0, 0, 0, 0),
                      ],
                      begin: Alignment(0.7, 0.3),
                      end: Alignment(0, 0),
                    ),
                  ),
                  padding: EdgeInsets.only(bottom: 50, right: 5),
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Int: ${hero.powerStats.intelligence}'),
                      Text('Str: ${hero.powerStats.strength}'),
                      Text('Spd: ${hero.powerStats.speed}'),
                      Text('Dur: ${hero.powerStats.durability}'),
                      Text('Pow: ${hero.powerStats.power}'),
                      Text('Com: ${hero.powerStats.combat}'),
                    ],
                  ),
                )
              ],
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
