import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Heroes heroes = ModalRoute.of(context).settings.arguments as Heroes;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(heroes.name),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: heroes.id,
                    child: Image.network(
                      heroes.images.lg,
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
                        begin: Alignment(0, 0.8),
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
                SizedBox(height: 10),
                Text(
                  'R\$ ${heroes.slug}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 1000),
              ],
            ),
          )
        ],
      ),
    );
  }
}
