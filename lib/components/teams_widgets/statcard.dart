import 'package:flutter/material.dart';
import 'package:hoop/components/style.dart';

class StatCard extends StatelessWidget {
  final String item1, item2, item3, item4;
  StatCard({
    this.item1,
    this.item2,
    this.item3,
    this.item4,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0XFFEDF1FF),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item1,
              style: styleDesign,
            ),
            Text(
              item2,
              style: styleDesign,
            ),
            Text(
              item3,
              style: styleDesign,
            ),
            Text(
              item4,
              style: styleDesign,
            ),
          ],
        ),
      ),
    );
  }
}
