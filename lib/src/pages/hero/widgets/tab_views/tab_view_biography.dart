import 'package:flutter/material.dart';
import 'package:rd_heroes/src/models/heroes/hero_model.dart';

class TabViewBiography extends StatelessWidget {
  final Heroes hero;
  TabViewBiography(this.hero);
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
                    'Full Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.fullName == null
                          ? 'Without Full Name'
                          : hero.biography.fullName,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'First Appearance',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.firstAppearance == null
                          ? 'Without First Appearance'
                          : hero.biography.firstAppearance,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Place of Birth',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.placeOfBirth == null
                          ? 'Without Place of Birth'
                          : hero.biography.placeOfBirth,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Alignment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.alignment == null
                          ? 'Without Alignment'
                          : hero.biography.alignment,
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
                    'Alter Egos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.alterEgos == null
                          ? 'Without Alter Egos'
                          : hero.biography.alterEgos,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Publisher',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: hero.biography.publisher == null
                          ? 'Without Publisher'
                          : hero.biography.publisher,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Aliases',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  listText(hero.biography.aliases),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RichText listText(List listAliases) {
    if (listAliases.isEmpty) {
      return RichText(text: TextSpan(text: 'Without Aliases'));
    } else {
      for (int i = 0; i < listAliases.length; i++) {
        return RichText(
          text: TextSpan(
            text: listAliases[i],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }
    }
    return null;
  }
}
