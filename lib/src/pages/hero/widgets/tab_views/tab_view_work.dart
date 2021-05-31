import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

class TabViewWork extends StatelessWidget {
  final Heroes hero;
  TabViewWork(this.hero);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 2 - 15,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Base',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.work.base == null
                          ? 'Without Base'
                          : hero.work.base,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 15,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Occupation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.work.occupation == null
                          ? 'Without Occupation'
                          : hero.work.occupation,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
