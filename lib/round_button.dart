import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function thisOnPress;
  RoundButton({@required this.icon, @required this.thisOnPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      constraints: BoxConstraints.tightFor(
        width: 53.0,
        height: 53.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: thisOnPress,
    );
  }
}
