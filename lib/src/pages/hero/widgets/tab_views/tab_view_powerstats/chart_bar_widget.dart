import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  final int hero;
  final String text;
  final Color color;
  ChartBarWidget(this.hero, this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.all(1),
                width: hero.toDouble() * 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color,
                ),
              ),
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: color,
                ),
              ),
              width: 300,
            ),
            SizedBox(width: 10),
            Text(hero.toString()),
          ],
        ),
      ],
    );
  }
}
