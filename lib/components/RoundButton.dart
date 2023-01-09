import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.iconData, this.clickData});
  final IconData? iconData;
  final VoidCallback? clickData;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: clickData,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF8D8E98),
    );
  }
}
