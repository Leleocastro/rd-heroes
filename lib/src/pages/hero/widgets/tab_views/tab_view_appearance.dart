import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

class TabViewAppearance extends StatelessWidget {
  final Heroes hero;
  TabViewAppearance(this.hero);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 15,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.gender == null
                          ? 'Without Gender'
                          : hero.appearance.gender,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Weight',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.weight[1] == null
                          ? 'Without Weight'
                          : hero.appearance.weight[1],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Hair Color',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.hairColor == null
                          ? 'Without Hair Color'
                          : hero.appearance.hairColor,
                      style: TextStyle(
                        fontSize: 20,
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
                    'Race',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.race == null
                          ? 'Without Race'
                          : hero.appearance.race,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Height',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.height[1] == null
                          ? 'Without Height'
                          : hero.appearance.height[1],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Eye Color',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.appearance.eyeColor == null
                          ? 'Without Eye Color'
                          : hero.appearance.eyeColor,
                      style: TextStyle(
                        fontSize: 20,
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
