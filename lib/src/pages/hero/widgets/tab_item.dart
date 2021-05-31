import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String item;
  TabItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: MediaQuery.of(context).size.width / 5 - 10,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            softWrap: false,
            text: TextSpan(
              text: item,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
