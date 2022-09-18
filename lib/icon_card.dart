import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconCard({
    @required this.text,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15.0),
        Text(text, style: kTextStyle),
      ],
    );
  }
}
