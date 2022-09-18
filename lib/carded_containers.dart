import 'package:flutter/material.dart';

class CardedContainers extends StatelessWidget {
  final Color cardColor;
  final Widget child;
  final Function passedOnTap;
  CardedContainers({
    @required this.passedOnTap,
    @required this.child,
    @required this.cardColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: passedOnTap,
        child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child,
        ));
  }
}
